//
//  LiteralComponentTests.swift
//  PathSlicer
//
//  Created by Michał Tynior on 17/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import PathSlicer

class LiteralComponentTests: XCTestCase {

    var literalComponent:  ComponentType? = nil
    
    override func setUp() {
        super.setUp()
        literalComponent = LiteralComponent()
    }
    
    override func tearDown() {
        literalComponent = nil
        super.tearDown()
    }
}

// MARK: - Matching

extension LiteralComponentTests {
    
    func test_ShouldMatchLiteralComponent() {
        let component = "lit3ral_c0mpon3n3t"
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertTrue(isMatch, "Should match literal components")
    }
    
    func test_ShouldNotMatchEmptyComponents() {
        let component = ""
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertFalse(isMatch, "Should not match empty components")
    }
    
    func test_ShouldNotMatchVariableComponent() {
        let component = "{variable}"
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertFalse(isMatch, "Should not match variable components")
    }
    
    func test_ShouldNotMatchRegexComponents() {
        let component = "(?<age>[\\d]{1,2})"
        
        let isMatch = literalComponent!.isMatch(component)
        
        XCTAssertFalse(isMatch, "Should not match regex components")
    }
    
}

// MARK: - Getting information about path

extension LiteralComponentTests {
    
    func test_ShouldReturnPassedComponentAsRegex() {
        let component = "lit3ral_c0mpon3n3t"
        let expectedRegex = "lit3ral_c0mpon3n3t"
        
        let actualRegex = literalComponent!.getCompomentInformation(component).regex
        
        XCTAssertEqual(actualRegex, expectedRegex, "Should return literal as regex component of path information")
    }
    
    func test_ForLiteralComponentsNameOfAComponentShouldNotBeReturned() {
        let component = "lit3ral_c0mpon3n3t"
        
        let actualName = literalComponent!.getCompomentInformation(component).name
        
        XCTAssertNil(actualName, "For literal components the name of a component should not be returned")
    }
    
}
