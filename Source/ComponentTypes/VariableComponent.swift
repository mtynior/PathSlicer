//
//  VarialbleComponent.swift
//  PathSlicer
//
//  Created by Michał Tynior on 16/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public class VariableComponent: ComponentType {
    
    public func isMatch(component: String) -> Bool {
        guard !component.isEmpty else {
            return false
        }
        
        return component.hasPrefix("{") && component.hasSuffix("}")
    }
    
    public func getCompomentInformation(component: String) -> ComponentInformation {
        let variableName = String( component.characters.dropFirst().dropLast() )
        
        return ComponentInformation(regex:"([^\\\\/]+?)", name: variableName)
    }
    
}