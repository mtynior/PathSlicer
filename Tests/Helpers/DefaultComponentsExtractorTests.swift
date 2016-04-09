//
//  DefaultComponentsExtractorTests.swift
//  PathSlicer
//
//  Created by Michał Tynior on 17/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

import XCTest
@testable import PathSlicer

class DefaultComponentsExtractorTests: XCTestCase {
    
    var extractor: ComponentsExtractorType? = nil
    
    override func setUp() {
        super.setUp()
        extractor = DefaultComponentsExtractor()
    }
    
    override func tearDown() {
        extractor = nil
        super.tearDown()
    }
    
}

// MARK: - Extraction

extension DefaultComponentsExtractorTests {
    
    func test_ShouldReturnNoComponentsForEmptyPath() {
        let path = ""
        let expectedNumberOfComponents = 0
        
        let actualNumberOfComponents = extractor!.extract(path).count
        
        XCTAssertEqual(actualNumberOfComponents, expectedNumberOfComponents, "Should not return any components for empty path")
    }
    
    func test_ShouldReturnNoComponentsForPathThatIsSlashOnly() {
        let path = "/"
        let expectedNumberOfComponents = 0
        
        let actualNumberOfComponents = extractor!.extract(path).count
        
        XCTAssertEqual(actualNumberOfComponents, expectedNumberOfComponents, "Should not return any components for path that is slash only")
    }
    
    func test_ShouldReturnComponentForPathWithoutSlashes() {
        let path = "endpoint"
        let expectedComponents = ["endpoint"]
        
        let actualComponents = extractor!.extract(path)
        
        XCTAssertEqual(actualComponents, expectedComponents, "Should return component for path without slashes")
    }
    
    func test_ShouldReturnComponentForPathWithLeadingSlash() {
        let path = "/endpoint"
        let expectedComponents = ["endpoint"]
        
        let actualComponents = extractor!.extract(path)
        
        XCTAssertEqual(actualComponents, expectedComponents, "Should return component for path with leading slash")
    }
    
    func test_ShouldReturnComponentForPathWithTrailingSlash() {
        let path = "endpoint/"
        let expectedComponents = ["endpoint"]
        
        let actualComponents = extractor!.extract(path)
        
        XCTAssertEqual(actualComponents, expectedComponents, "Should return component for path with leading slash")
    }
    
    func test_ShouldUseSlashToSeparateMultipleComponentsFromPath() {
        let path = "posts/{post_id}/add_comment"
        let expectedComponents = ["posts", "{post_id}", "add_comment"]
        
        let actualComponents = extractor!.extract(path)
        
        XCTAssertEqual(actualComponents, expectedComponents, "Should use slash to separate multiple components from a path")
    }
    
    func test_ShouldIgnoreSlashWhenItIsPartOfRegularExpression() {
        let path = "^(?<name>[a-z]{3,10}(?:/{1})(?<action>[a-z]{5,10}))$"
        let expectedComponents = ["^(?<name>[a-z]{3,10}(?:/{1})(?<action>[a-z]{5,10}))$"]
        
        let actualComponents = extractor!.extract(path)
        
        XCTAssertEqual(actualComponents, expectedComponents, "Should ignore slash when it is part of regular expression")
    }
    
}