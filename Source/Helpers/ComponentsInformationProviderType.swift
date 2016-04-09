//
//  ComponentsInformationProviderType.swift
//  PathSlicer
//
//  Created by Michał Tynior on 22/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public protocol ComponentsInformationProviderType {
    
    var componentTypes: [ComponentType] { get set }
    
    func getComponentsInformation(components:[String]) -> [ComponentInformation]
    
}