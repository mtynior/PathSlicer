//
//  PathSlicerType.swift
//  PathSlicer
//
//  Created by Michał Tynior on 16/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public protocol PathDescriptionProviderType {
    
    var componentsExtractor: ComponentsExtractorType { get set }
    var componentsInformationProvider: ComponentsInformationProviderType { get set }
    var pathDescriptionFactory: PathDescriptionFactoryType { get set }
    
    func registerComponentType(componentType: ComponentType) -> Void
    
    func getPathDescription(path:String) -> PathDescription
    
}