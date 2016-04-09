//
//  LiteralComponent.swift
//  PathSlicer
//
//  Created by Michał Tynior on 16/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public class LiteralComponent: ComponentType {
    
    public func isMatch(component: String) -> Bool {
        guard !component.isEmpty else {
            return false
        }
        
        let isVariable = component.hasPrefix("{") && component.hasSuffix("}")
        let isRegex = component.hasPrefix("(?") && component.hasSuffix(")")
        
        return !(isVariable || isRegex)
    }
    
    public func getCompomentInformation(component: String) -> ComponentInformation {
        // just pass component as literal regex
        return ComponentInformation(regex:component, name: nil)
    }
    
}