//
//  DefaultPathDescriptionFactory.swift
//  PathSlicer
//
//  Created by Michał Tynior on 22/11/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

public class DefaultPathDescriptionFactory: PathDescriptionFactoryType {
    
    public func createPathDescription(pathComponents: [ComponentInformation]) -> PathDescription {
        var regexPath = pathComponents.flatMap{$0.regex}.joinWithSeparator("\\/")
        if(!regexPath.isEmpty) {
            regexPath += "(?:\\/(?=$))?$"
        }
        
        let arguments = pathComponents.flatMap{$0.name}
        
        return PathDescription(regex:regexPath, arguments:arguments)
    }
    
}