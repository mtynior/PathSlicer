//
//  ComponentInformationTests.swift
//  PathSlicer
//
//  Created by Michał Tynior on 22/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import PathSlicer

class ComponentInformationTests: XCTestCase {

    func test_EqualityOperatorShouldReturnTrueForTheSameObjects() {
        let componentInfo1 = ComponentInformation(regex: "([^\\\\/]+?)", name: "viarable")
        let componentInfo2 = ComponentInformation(regex: "([^\\\\/]+?)", name: "viarable")

        XCTAssertEqual(componentInfo1, componentInfo2, "Equality operator should return true for the same objects")
    }
    
    func test_EqualityOperatorShouldReturnFalseWhenRegexPropertiesAreDifferent() {
        let componentInfo1 = ComponentInformation(regex: "lieral_regex", name: nil)
        let componentInfo2 = ComponentInformation(regex: "another_literal_regex", name: nil)
        
        XCTAssertNotEqual(componentInfo1, componentInfo2, "Equality operator should return false when regex properties are different")
    }
    
    func test_EqualityOperatorShouldReturnFalseWhenNamePropertiesAreDifferent() {
        let componentInfo1 = ComponentInformation(regex: "([^\\\\/]+?)", name: "variable")
        let componentInfo2 = ComponentInformation(regex: "([^\\\\/]+?)", name: "another_variable")
        
        XCTAssertNotEqual(componentInfo1, componentInfo2, "Equality operator should return false when name properties are different")
    }
    
}
