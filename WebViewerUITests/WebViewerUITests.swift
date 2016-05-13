//
//  WebViewerUITests.swift
//  WebViewerUITests
//
//  Created by Carlos Poles on 7/05/2016.
//  Copyright © 2016 Carlos Poles. All rights reserved.
//

import XCTest

class WebViewerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func wait(delay: NSTimeInterval = 2) {
        let runLoop = NSRunLoop.mainRunLoop()
        let d = NSDate(timeIntervalSinceNow: delay)
        runLoop.runUntilDate(d)
    }
    
    func testEmptyURL() {
        
        let app = XCUIApplication()
        wait()
        let enterUrlTextField = app.textFields["Enter URL"]
        enterUrlTextField.tap()
        wait()
        app.typeText("\r")
        wait()
        app.alerts["URL Field Empty"].collectionViews.buttons["OK"].tap()
        wait()
        enterUrlTextField.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testWrongURL() {
        let app = XCUIApplication()
        wait()
        let textField = app.textFields["Enter URL"]
        textField.tap()
        wait()
        app.typeText("yo\r")
        wait()
        let okButton = app.alerts["Invalid URL"].collectionViews.buttons["OK"]
        okButton.tap()
    }
    
}
