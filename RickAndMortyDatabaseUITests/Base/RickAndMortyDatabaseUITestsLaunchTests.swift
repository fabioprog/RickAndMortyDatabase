//
//  RickAndMortyDatabaseUITestsLaunchTests.swift
//  RickAndMortyDatabaseUITests
//
//  Created by Fabio Augusto Resende on 15/08/23.
//

import XCTest

final class RickAndMortyDatabaseUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
