//
//  PathSlicerTests.swift
//  PathSlicer
//
//  Created by Michał Tynior on 19/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

import Foundation

import XCTest
@testable import PathSlicer

class PathSlicerTests: XCTestCase {
    
    var pathInfoProvider: PathDescriptionProviderType? = nil
    
    override func setUp() {
        super.setUp()
        pathInfoProvider = PathSlicer()
    }
    
    override func tearDown() {
        pathInfoProvider = nil
        super.tearDown()
    }
}

// MARK: - Registering new component types

class FakeComponentType: ComponentType {
    func isMatch(component: String) -> Bool {
        return false;
    }
    
    func getCompomentInformation(component: String) -> ComponentInformation {
        return ComponentInformation(regex: "", name: nil)
    }
}


extension PathSlicerTests {
    
    func test_ShouldRegisterNewComponentType() {
        let fakeComponentType = FakeComponentType()
        let expectedNumberOfRegisteredCompoentTypes = pathInfoProvider!.componentsInformationProvider.componentTypes.count + 1
        
        pathInfoProvider!.registerComponentType(fakeComponentType)
        let actualNumberOfRegisteredCompoentTypes = pathInfoProvider!.componentsInformationProvider.componentTypes.count

        XCTAssertEqual(actualNumberOfRegisteredCompoentTypes, expectedNumberOfRegisteredCompoentTypes, "Should register new component type")
    }
    
}

// MARK: - Returning descritpion

extension PathSlicerTests {
    
    func test_ShouldReturnEmptyDescriptionForEmptyPath() {
        let path = ""
        let expectedDescription = PathDescription(regex: "", arguments: [])
        
        let actualDescription = pathInfoProvider!.getPathDescription(path)
        
        XCTAssertEqual(actualDescription, expectedDescription, "Should return empty description for empty path")
    }
    
    func test_ShouldReturnEmptyDescriptionForPathWithOnlySlash() {
        let path = "/"
        let expectedDescription = PathDescription(regex: "", arguments: [])
        
        let actualDescription = pathInfoProvider!.getPathDescription(path)
        
        XCTAssertEqual(actualDescription, expectedDescription, "Should return empty description for path with only slash")
    }
    
    func test_ShouldReturnRegexInDescriptionForActualPath() {
        let path = "/redsquad"
        
        let actualRegex = pathInfoProvider!.getPathDescription(path).regex
        
        XCTAssertFalse(actualRegex.isEmpty, "Should return regex for actual path")
    }
    
    func test_ShouldReturnArgumentsInDescriptionPathWithParametersInSegments() {
        let path = "/redsquad/{pilot}/atack"
        let expectedNumberOfArguments = 1
        
        let actualArguments = pathInfoProvider!.getPathDescription(path).arguments
        
        XCTAssertEqual(actualArguments.count, expectedNumberOfArguments, "Should return arguments for path with parameters in segments")
    }
    
}

