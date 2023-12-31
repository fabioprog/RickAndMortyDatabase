//
//  XCUIElement.swift
//  RickAndMortyDatabaseUITests
//
//  Created by Fabio Augusto Resende on 15/08/23.
//

import XCTest

extension XCUIElement {
    
    @discardableResult
    private func wait(
        until expression: @escaping (XCUIElement) -> Bool,
        timeout: TimeInterval,
        message: @autoclosure () -> String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if expression(self) {
            return self
        }

        let predicate = NSPredicate { _, _ in
            expression(self)
        }

        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: nil)

        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)

        if result != .completed {
            XCTFail(
                message().isEmpty ? "expectation not matched after waiting" : message(),
                file: file,
                line: line
            )
        }

        return self
    }
    
    @discardableResult
    private func wait<Value: Equatable>(
        until keyPath: KeyPath<XCUIElement, Value>,
        matches match: Value,
        timeout: TimeInterval,
        message: @autoclosure () -> String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        wait(
            until: { $0[keyPath: keyPath] == match },
            timeout: timeout,
            message: message(),
            file: file,
            line: line
        )
    }

    @discardableResult
    func wait(
        until keyPath: KeyPath<XCUIElement, Bool>,
        timeout: TimeInterval,
        message: @autoclosure () -> String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        wait(
            until: keyPath,
            matches: true,
            timeout: timeout,
            message: message(),
            file: file,
            line: line
        )
    }
}
