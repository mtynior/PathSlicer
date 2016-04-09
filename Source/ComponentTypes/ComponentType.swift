//
//  ComponentMapperType.swift
//  PathSlicer
//
//  Created by Michał Tynior on 16/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public protocol ComponentType {
    
    func isMatch(component:String) -> Bool
    
    func getCompomentInformation(component:String) -> ComponentInformation
    
}