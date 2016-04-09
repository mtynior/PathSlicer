//
//  PathDescriptionFactoryType.swift
//  PathSlicer
//
//  Created by Michał Tynior on 22/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public protocol PathDescriptionFactoryType {
    
    func createPathDescription(pathComponents: [ComponentInformation]) -> PathDescription
    
}