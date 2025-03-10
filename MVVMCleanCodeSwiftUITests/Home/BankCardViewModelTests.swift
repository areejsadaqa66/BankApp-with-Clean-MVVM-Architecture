//
//  BankCardViewModelTests.swift
//  MVVMCleanCodeSwiftUITests
//
//  Created by MacBookPro on 10/03/2025.
//

import XCTest
import Combine
import SwiftUI
@testable import MVVMCleanCodeSwiftUI

class BankCardViewModelTests: XCTestCase {
    
    var viewModel: BankCardViewModel!
    var mockUseCase: MockFetchBankCardsUseCase!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockFetchBankCardsUseCase()
        viewModel = BankCardViewModel(FetchBankCardsUseCase: mockUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        cancellables = []
        super.tearDown()
    }
    
    func testFetchBankCards_success() async {
        // Given
        let mockBankCards = [
            BankCard(cardNumber: "1234 5678 9876 5432", cardHolder: "John Doe", expiryDate: "12/25", gradientColors: [.blue, .purple]),
            BankCard(cardNumber: "2345 6789 8765 4321", cardHolder: "Jane Doe", expiryDate: "01/26", gradientColors: [.green, .yellow])
        ]
        mockUseCase.mockResult = .success(mockBankCards)
        
        // When
        await viewModel.fetchBankCards()
        
        // Then
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertEqual(viewModel.bankCard.count, 2)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.bankCard.first?.cardNumber, "1234 5678 9876 5432")
    }
    
    func testFetchBankCards_failure() async {
        // Given
        mockUseCase.mockResult = .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch"]))
        
        // When
        await viewModel.fetchBankCards()
        
        // Then
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertNil(viewModel.bankCard)
        XCTAssertEqual(viewModel.errorMessage, "Failed to fetch")
    }
    
    func testIsLoadingState() async {
        // Given
        mockUseCase.mockResult = .success([BankCard(cardNumber: "1234 5678 9876 5432", cardHolder: "John Doe", expiryDate: "12/25", gradientColors: [.blue, .purple])])
        
        // When
        await viewModel.fetchBankCards()
        
        // Then
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertEqual(viewModel.bankCard.count, 1)
    }
    
    class MockFetchBankCardsUseCase: FetchBankCardsUseCaseProtocol {
        var mockResult: Result<[BankCard], Error>?
        
        func execute() async -> Result<[BankCard], Error> {
            return mockResult ?? .failure(NSError(domain: "", code: -1, userInfo: nil))
        }
    }
}
