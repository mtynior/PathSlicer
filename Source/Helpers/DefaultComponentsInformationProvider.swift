//
//  DefaultComponentsInformationProvider.swift
//  PathSlicer
//
//  Created by Michał Tynior on 22/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public class DefaultComponentsInformationProvider: ComponentsInformationProviderType {
    
    public var componentTypes: [ComponentType] = [
        LiteralComponent(),
        VariableComponent(),
        RegexComponent()
    ]
    
    public func getComponentsInformation(components:[String]) -> [ComponentInformation] {
        var componentsInformation: [ComponentInformation] = []
        
        for component in components {
            if let componentInfo = getComponentInformation(component) {
                componentsInformation.append(componentInfo)
            }
        }
        
        return componentsInformation
    }

    private func getComponentInformation(component:String) -> ComponentInformation? {
        for componentType in componentTypes {
            if (componentType.isMatch(component)) {
                return componentType.getCompomentInformation(component)
            }
        }
        return nil
    }
    
}