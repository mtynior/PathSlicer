//
//  ComponentInformation.swift
//  PathSlicer
//
//  Created by Michał Tynior on 16/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public struct ComponentInformation {
    
    var regex: String
    
    var name: String?
    
}


// MARK: Equatable protocol

extension ComponentInformation: Equatable {}

public func ==(lhs: ComponentInformation, rhs: ComponentInformation) -> Bool {
    return lhs.regex == rhs.regex
        && lhs.name == rhs.name
}