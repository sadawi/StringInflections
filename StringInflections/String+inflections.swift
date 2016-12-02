//
//  String+inflections.swift
//  StringInflections
//
//  Created by Sam Williams on 12/2/16.
//  Copyright © 2016 Sam Williams. All rights reserved.
//

import Foundation

public extension String {
    func pluralized() -> String {
        return Inflector.pluralizer.apply(to: self)
    }

    func singularized() -> String {
        return Inflector.singularizer.apply(to: self)
    }
}
