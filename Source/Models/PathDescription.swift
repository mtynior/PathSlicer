//
//  PathDescription.swift
//  PathSlicer
//
//  Created by Michał Tynior on 17/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public struct PathDescription {
    
    var regex: String = ""
    
    var arguments: [String] = []
}

// MARK: Equatable protocol

extension PathDescription: Equatable {}

public func ==(lhs: PathDescription, rhs: PathDescription) -> Bool {
    return lhs.regex == rhs.regex
        && lhs.arguments == rhs.arguments
}