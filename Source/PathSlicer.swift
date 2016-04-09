//
//  PathSlicer.swift
//  PathSlicer
//
//  Created by Michał Tynior on 16/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public class PathSlicer: PathDescriptionProviderType {
    
    public var componentsExtractor: ComponentsExtractorType = DefaultComponentsExtractor()
    public var componentsInformationProvider: ComponentsInformationProviderType = DefaultComponentsInformationProvider()
    public var pathDescriptionFactory: PathDescriptionFactoryType = DefaultPathDescriptionFactory()
    
    
    public func registerComponentType(componentType: ComponentType) {
        componentsInformationProvider.componentTypes.append(componentType)
    }
    
    public func getPathDescription(path: String) -> PathDescription {
        
        let components = componentsExtractor.extract(path)
        let componentsInformation = componentsInformationProvider.getComponentsInformation(components)
        
        return pathDescriptionFactory.createPathDescription(componentsInformation)
    }
}