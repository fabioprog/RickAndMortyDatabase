//
//  CharactersUITests.swift
//  RickAndMortyDatabaseUITests
//
//  Created by Fabio Augusto Resende on 15/08/23.
//

import XCTest

final class CharactersUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testDetailNavigation() {
        CharactersPage()
            .tapDetailNavigation()
            .dismissDetailNavigation()
    }
    
    func testFilterClear() {
        CharactersPage()
            .tapFilterNavigation()
            .tapFilterName()
            .setFilterName(text: "Clear Test")
            .dismissKeyboard()
            .tapFilterStatus()
            .tapFilterStatusActionDead()
            .tapFilterClearButton()
    }
    
    func testFilterByName() {
        let name: String = "Mr. Meeseeks"
        CharactersPage()
            .tapFilterNavigation()
            .tapFilterName()
            .setFilterName(text: name)
            .dismissKeyboard()
            .tapApplyButton()
        
        if CharactersPage()
            .collectionView(CharacterUIIdentifier.collectionView.text)
            .cells.firstMatch.waitForExistence(timeout: 5) {
            
            let filterResult = CharactersPage().label(name).exists
            XCTAssert(filterResult)
        }
    }
    
    func testFilterByStatus() {
        CharactersPage()
            .tapFilterNavigation()
            .tapFilterStatus()
            .tapFilterStatusActionDead()
            .tapApplyButton()
        
        if CharactersPage()
            .collectionView(CharacterUIIdentifier.collectionView.text)
            .cells.firstMatch.waitForExistence(timeout: 5) {

            let filterResult = CharactersPage().label("Albert Einstein").exists
            XCTAssert(filterResult)
        }
    }
    
    //MARK: Performance Tests
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
