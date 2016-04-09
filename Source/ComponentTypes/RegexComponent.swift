//
//  RegexComponent.swift
//  PathSlicer
//
//  Created by Michał Tynior on 16/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public class RegexComponent: ComponentType {
    
    public func isMatch(component: String) -> Bool {
        guard !component.isEmpty else {
            return false
        }
        
        return component.hasPrefix("(?") && component.hasSuffix(")")
    }
    
    public func getCompomentInformation(component: String) -> ComponentInformation {
        let componentInfo = ComponentInformation(regex:component, name: nil)
        return componentInfo
    }
    
}