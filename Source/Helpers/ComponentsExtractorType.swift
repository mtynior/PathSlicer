//
//  ComponentsExtractorType.swift
//  PathSlicer
//
//  Created by Michał Tynior on 17/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public protocol ComponentsExtractorType {
    
    func extract(path:String) -> [String]
    
}