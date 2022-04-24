//
//  HomeView_UITests.swift
//  MyDevicesUITests
//
//  Created by Felipe Passos on 23/04/22.
//

import XCTest

class HomeView_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func test_WhenTapOnDeviceItem_ThenShouldOpenDetailView() throws {
        app.scrollViews.otherElements.staticTexts["Apple iPhone 13 Pro"].tap()
        
        let navBar = app.navigationBars["Apple iPhone 13 Pro"]
        let navBarExistis = navBar.waitForExistence(timeout: 5)
        let favouriteIconExists = navBar.images["FavouriteIcon"].waitForExistence(timeout: 5)
        
        XCTAssertTrue(navBarExistis)
        XCTAssertTrue(favouriteIconExists)
    }

    func test_WhenUserTypesSearch_ThenShouldShowResults() throws {
        #if targetEnvironment(simulator)
            let setHardwareLayout = NSSelectorFromString("setHardwareLayout:")
            UITextInputMode.activeInputModes
                .filter({ $0.responds(to: setHardwareLayout) })
                .forEach { $0.perform(setHardwareLayout, with: nil) }
        #endif
        
        app.scrollViews.otherElements.containing(.image, identifier:"iphone").element.swipeDown()
        app.navigationBars["Home"].searchFields["Search"].tap()
        
        app/*@START_MENU_TOKEN@*/.keyboards.keys["I"]/*[[".keyboards.keys[\"I\"]",".keys[\"I\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keyboards.keys["p"]/*[[".keyboards.keys[\"p\"]",".keys[\"p\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keyboards.keys["h"]/*[[".keyboards.keys[\"h\"]",".keys[\"h\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        let searchResultsExists = app.scrollViews.otherElements.staticTexts["searchResultsAmmount"].waitForExistence(timeout: 5)
        
        XCTAssertTrue(searchResultsExists)
    }
    
    func test_WhenLaunchesTheApp_ThenShouldShowResultsAfterLoading() throws {
        let itemExists = app.scrollViews.otherElements.staticTexts["Apple iPhone 13 Pro"].waitForExistence(timeout: 5)
    
        XCTAssertTrue(itemExists)
    }
    
    func test_WhenComesBackFromDestination_ThenShouldGoBackFromDestination() throws {
        app.scrollViews.otherElements.children(matching: .image).matching(identifier: "iphone").element(boundBy: 0).tap()
        app.navigationBars["Apple iPhone 13 Pro"].children(matching: .other).element/*@START_MENU_TOKEN@*/.swipeDown()/*[[".swipeDown()",".swipeLeft()"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        
        let navBarExists = app.navigationBars["Home"].waitForExistence(timeout: 5)
        XCTAssertTrue(navBarExists)
    }
}
