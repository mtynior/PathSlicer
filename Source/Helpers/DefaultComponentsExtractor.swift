//
//  DefaultComponentExtractor.swift
//  PathSlicer
//
//  Created by Michał Tynior on 17/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public class DefaultComponentsExtractor: ComponentsExtractorType {
    
    public func extract(path: String) -> [String] {
        guard !path.isEmpty else {
            return []
        }
        
        // remove leading and trailing slashes if necessary
        let unifiedPath = path.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "/"))
        
        guard !unifiedPath.isEmpty else {
            return []
        }
        
        var components = [String]()
        var currentComponent = ""
        var openingParenthesesCount = 0

        for index in  0..<unifiedPath.characters.count {
            let character = unifiedPath[unifiedPath.startIndex.advancedBy(index)]
            
            if(character == "(") {
                openingParenthesesCount += 1
            }
            
            if(character == ")") {
                openingParenthesesCount -= 1
            }
            
            if(character != "/" || openingParenthesesCount > 0) {
                currentComponent.append(character)
            }
            
            if ((character == "/" || index == unifiedPath.characters.count - 1) && !currentComponent.isEmpty && openingParenthesesCount == 0) {
                components.append(currentComponent)
                currentComponent = ""
            }
        }

        return components
    }
    
}