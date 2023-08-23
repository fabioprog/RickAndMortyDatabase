//
//  CharactersPage.swift
//  RickAndMortyDatabaseUITests
//
//  Created by Fabio Augusto Resende on 15/08/23.
//

import XCTest

public class CharactersPage: BaseTest {
    
    override var rootElement: XCUIElement {
        return collectionView(CharacterUIIdentifier.collectionView.text)
    }
    
    @discardableResult
    func tapDetailNavigation() -> Self {
        if collectionView(CharacterUIIdentifier.collectionView.text)
            .cells.firstMatch.waitForExistence(timeout: 5) {
            
            collectionView(CharacterUIIdentifier.collectionView.text)
                .cells.firstMatch.tap()
        }
        return self
    }
    
    @discardableResult
    func dismissDetailNavigation() -> Self {
        navigationBar(CharacterUIIdentifier.navigationBar.text)
            .buttons
            .element(boundBy: 0)
            .tap()
        return self
    }

    @discardableResult
    func tapFilterNavigation() -> Self {
        button(CharacterUIIdentifier.filterNavigationButton.text).tap()
        return self
    }
    
    // Filter
    @discardableResult
    func tapFilterName() -> Self {
        textField(CharacterUIIdentifier.filterName.text)
            .tap()
        return self
    }
    
    @discardableResult
    func setFilterName(text: String) -> Self {
        textField(CharacterUIIdentifier.filterName.text)
            .typeText(text)
        return self
    }
    
    @discardableResult
    func tapFilterStatus() -> Self {
        button(CharacterUIIdentifier.filterStatus.text)
            .tap()
        return self
    }
    
    @discardableResult
    func tapFilterStatusActionDead() -> Self {
        button(CharacterUIIdentifier.filterStatusActionDead.text)
            .wait(until: \.exists, timeout: 2)
            .tap()
        return self
    }
    
    @discardableResult
    func tapFilterClearButton() -> Self {
        button(CharacterUIIdentifier.filterClearButton.text)
            .tap()
        return self
    }
    
    @discardableResult
    func tapApplyButton() -> Self {
        button(CharacterUIIdentifier.filterApplyButton.text)
            .tap()
        return self
    }
}
