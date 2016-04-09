//
//  VariableComponentTests.swift
//  PathSlicer
//
//  Created by Michał Tynior on 17/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import PathSlicer

class VariableComponentTests: XCTestCase {

    var literalComponent:  ComponentType? = nil
    
    override func setUp() {
        super.setUp()
        literalComponent = VariableComponent()
    }
    
    override func tearDown() {
        literalComponent = nil
        super.tearDown()
    }
    
}


// MARK: - Matching

extension VariableComponentTests {
    
    func test_ShouldMatchVariableComponent() {
        let component = "{user_id}"
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertTrue(isMatch, "Should match variable components")
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
    
    func test_ShouldNotMatchRegexComponents() {
        let component = "(?<age>[\\d]{1,2})"
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertFalse(isMatch, "Should not match regex components")
    }
    
}


// MARK: - Getting information about path

extension VariableComponentTests {

    func test_ShouldReturnSpecificRegex() {
        let component = "{service_id}"
        let expectedRegex = "([^\\\\/]+?)"
        
        let actualRegex = literalComponent!.getCompomentInformation(component).regex
        
        XCTAssertEqual(actualRegex, expectedRegex, "Should return specific regex for variable components")
    }
    
    func test_ShouldReturnNameOfTheVariable() {
        let component = "{username}"
        let expectedName = "username"
        
        let actualName = literalComponent!.getCompomentInformation(component).name
        
        XCTAssertEqual(actualName, expectedName, "Should return variable name for variable components")
    }

}
