//
//  String+inflections.swift
//  StringInflections
//
//  Created by Sam Williams on 12/2/16.
//  Copyright © 2016 Sam Williams. All rights reserved.
//

import Foundation

public extension String {
    /**
     Converts "snake_case" to "snakeCase" and "Normal spacing" to "normalSpacing"
     
     - parameter uppercaseFirst: Whether the first letter should be uppercase.
     */
    func camelCased(uppercaseFirst: Bool = false) -> String {
        return self.uncamelCased().replacingMatches(of: " +", with: "_")
            .components(separatedBy: "_")
            .enumerated().map { (index, part) in
            if index == 0 && !uppercaseFirst {
                return part.lowercased()
            } else {
                return part.capitalized
            }
            }.joined()
    }

    private func joiningWords(with separator: String) -> String {
        return self.replacingMatches(of: "[- ]", with: separator)
    }
    
    func uncamelCased() -> String {
        return self
            .replacingMatches(of: "([A-Z]+)([A-Z][a-z])", with: "$1 $2")
            .replacingMatches(of: "([a-z\\d])([A-Z])", with: "$1 $2")
    }

    /**
     Converts "camelCased" to "camel_cased" and "Normal spacing" to "normal_spacing".
     */
    func underscored() -> String {
        return self.uncamelCased().joiningWords(with: "_").lowercased()
    }
    
    /**
     Converts "camelCased" to "camel-cased" and "Normal spacing" to "normal-spacing".
     */
    func kebabCased() -> String {
        return self.uncamelCased().joiningWords(with: "-").lowercased()
    }
    
    /**
     Converts self to the specified casing style.
     */
    func to(case stringCase: StringCase) -> String {
        switch stringCase {
        case .lower:
            return self.lowercased()
        case .upper:
            return self.uppercased()
        case .capitalized:
            return self.capitalized
        case .upperCamel:
            return self.camelCased(uppercaseFirst: true)
        case .lowerCamel:
            return self.camelCased(uppercaseFirst: false)
        case .snake:
            return self.underscored()
        case .kebab:
            return self.kebabCased()
        }
    }
}
