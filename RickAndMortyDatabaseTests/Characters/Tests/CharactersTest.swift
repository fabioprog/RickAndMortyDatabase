//
//  CharactersTest.swift
//  RickAndMortyDatabaseTests
//
//  Created by Fabio Augusto Resende on 16/08/23.
//

import XCTest
@testable import RickAndMortyDatabase

final class CharactersTest: XCTestCase {
    
    func testCharactersRequest() async {
        do {
            let characterResponse = try await CharacterClient().getCharacters(page: nil, name: nil, status: nil)
            XCTAssertTrue(characterResponse.results.count > 0)
        } catch {}
    }
    
    func testMockCharactersRequest() async {
        do {
            let characterResponse = try await CharacterMockClient().getCharacters(page: nil, name: nil, status: nil)
            XCTAssertTrue(characterResponse.results.count > 0)
        } catch {}
    }
    
    func testCharactersViewModelRequest() {
        let viewModel = CharactersViewModel(
            navigator: CharactersNavigator(navigationController: UINavigationController()), client: CharacterMockClient())
        
        let expectation = XCTestExpectation(description: "characters loaded")
        
        viewModel.fetchCharacters(name: nil, status: nil)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(viewModel.characters.count > 0)
            XCTAssertTrue(viewModel.hasMorePages)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testCharactersViewModelRequestWithFilter() {
        let viewModel = CharactersViewModel(
            navigator: CharactersNavigator(navigationController: UINavigationController()), client: CharacterMockClient())
        
        let expectation = XCTestExpectation(description: "characters loaded")
        
        let name: String = "Rick"
        let status: String = "Alive"
        
        viewModel.fetchCharacters(name: name, status: status)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(viewModel.characters.contains(where: { $0.name.contains(name) }))
            XCTAssertTrue(viewModel.characters.allSatisfy({ $0.status.text == status }))
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
