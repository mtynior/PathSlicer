//
//  DefaultPathDescriptionFactoryTests.swift
//  PathSlicer
//
//  Created by Michał Tynior on 22/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import XCTest
@testable import PathSlicer

class DefaultPathDescriptionFactoryTests: XCTestCase {

    var factory: PathDescriptionFactoryType? = nil
    
    override func setUp() {
        super.setUp()
        factory = DefaultPathDescriptionFactory()
    }
    
    override func tearDown() {
        factory = nil;
        super.tearDown()
    }

}

// MARK: - Path Description creation

extension DefaultPathDescriptionFactoryTests {
    
    func test_ShouldReturnEmptyDescriptionWhenNoComponentsProvided() {
        
        let expectedDescription = PathDescription()
        
        let actualDesctiption = factory!.createPathDescription([])
        
        XCTAssertEqual(actualDesctiption, expectedDescription, "Should return empty description when no components has been provided")
    }
    
    func test_ShouldReturnRegexAndNoArgumentsInDescriptionForLiteralPath() {
        let component_01 = ComponentInformation(regex: "redsquad", name: nil)
        let components = [ component_01 ]
        
        let expectedDescription = PathDescription(regex: "redsquad(?:\\/(?=$))?$", arguments: [])
        
        let actualDescription = factory!.createPathDescription(components)
        
        XCTAssertEqual(actualDescription, expectedDescription, "Should regex and no arguments for literal path")
    }
    
    func test_ShouldReturnRegexThatContainsComponentsCombinedBySlashes() {
        let component_01 = ComponentInformation(regex: "redsquad\\/redleader\\/attact", name: nil)
        let components = [ component_01 ]
        
        let expectedDescription = PathDescription(regex: "redsquad\\/redleader\\/attact(?:\\/(?=$))?$", arguments: [])
        
        let actualDescription = factory!.createPathDescription(components)
        
        XCTAssertEqual(actualDescription, expectedDescription, "Should return regex that contains components combined by slashes")
    }
    
    func test_ShouldReturnDescriptionWithArguments() {
        // path: /redsquad/{pilot}/{action}        
        let component_01 = ComponentInformation(regex: "redsquad", name: nil)
        let component_02 = ComponentInformation(regex: "([^\\\\/]+?)", name: "pilot")
        let component_03 = ComponentInformation(regex: "([^\\\\/]+?)", name: "action")
        let components = [ component_01, component_02, component_03 ]
        
        let expectedDescription = PathDescription(regex: "redsquad\\/([^\\\\/]+?)\\/([^\\\\/]+?)(?:\\/(?=$))?$", arguments: ["pilot", "action"])
        
        let actualDescription = factory!.createPathDescription(components)
        
        XCTAssertEqual(actualDescription, expectedDescription, "Should return description with arguments")
    }
    
}


