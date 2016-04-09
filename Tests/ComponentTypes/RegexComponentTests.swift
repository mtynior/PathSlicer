//
//  RegexComponentTests.swift
//  PathSlicer
//
//  Created by Michał Tynior on 17/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import PathSlicer

class RegexComponentTests: XCTestCase {

    var literalComponent:  ComponentType? = nil
    
    override func setUp() {
        super.setUp()
        literalComponent = RegexComponent()
    }
    
    override func tearDown() {
        literalComponent = nil
        super.tearDown()
    }

}

// MARK: - Matching

extension RegexComponentTests {
    
    
    func test_ShouldMatchRegexComponents() {
        let component = "(?<age>[\\d]{1,2})"
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertTrue(isMatch, "Should match regex components")
    }
    
    func test_ShouldNotMatchEmptyComponents() {
        let component = ""
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertFalse(isMatch, "Should not match empty components")
    }
    
    func test_ShouldNotMatchVLiteralComponents() {
        let component = "luke_skywalker"
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertFalse(isMatch, "Should not match literal components")
    }
    
    func test_ShouldNotMatchVariableComponent() {
        let component = "{user_id}"
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertFalse(isMatch, "Should not match variable components")
    }
    
}

// MARK: - Getting information about path

extension RegexComponentTests {
    
    func test_ShouldReturnPassedComponentAsRegex() {
        let component = "(?<age>[\\d]{1,2})"
        let expectedRegex = "(?<age>[\\d]{1,2})"
        
        let actualRegex = literalComponent!.getCompomentInformation(component).regex
        
        XCTAssertEqual(actualRegex, expectedRegex, "Should return passed component as regex")
    }
    
    func test_ForRegexComponentsNameOfAComponentShouldNotBeReturned() {
        let component = "(?<age>[\\d]{1,2})"
        
        let actualName = literalComponent!.getCompomentInformation(component).name
        
        XCTAssertNil(actualName, "For regex components the name of a component should not be returned")
    }
    
}
