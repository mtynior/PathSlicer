//
//  PathDescriptionTests.swift
//  PathSlicer
//
//  Created by Michał Tynior on 22/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import PathSlicer

class PathDescriptionTests: XCTestCase {

    func test_EqualityOperatorShouldReturnTrueForTheSameObjects() {
        let componentInfo1 = PathDescription(regex: "([^\\\\/]+?)", arguments: ["viarable"])
        let componentInfo2 = PathDescription(regex: "([^\\\\/]+?)", arguments: ["viarable"])
        
        XCTAssertEqual(componentInfo1, componentInfo2, "Equality operator should return true for the same objects")
    }
    
    func test_EqualityOperatorShouldReturnFalseWhenRegexPropertiesAreDifferent() {
        let componentInfo1 = PathDescription(regex: "lieral_regex", arguments: [])
        let componentInfo2 = PathDescription(regex: "another_literal_regex", arguments: [])
        
        XCTAssertNotEqual(componentInfo1, componentInfo2, "Equality operator should return false when regex properties are different")
    }
    
    func test_EqualityOperatorShouldReturnFalseWhenArgumentsPropertiesAreDifferent() {
        let componentInfo1 = PathDescription(regex: "([^\\\\/]+?)", arguments: ["variable"])
        let componentInfo2 = PathDescription(regex: "([^\\\\/]+?)", arguments: ["another_variable"])
        
        XCTAssertNotEqual(componentInfo1, componentInfo2, "Equality operator should return false when arguments properties are different")
    }

}
