//
//  String+inflections.swift
//  StringInflections
//
//  Created by Sam Williams on 12/2/16.
//  Copyright © 2016 Sam Williams. All rights reserved.
//

import Foundation

public extension String {
    func camelCased(lowercaseFirst: Bool = true) -> String {
        return self.components(separatedBy: "_").enumerated().map { (index, part) in
            if index == 0 && lowercaseFirst {
                return part.lowercased()
            } else {
                return part.capitalized
            }
            }.joined()
    }

    func underscored() -> String {
        return self
            .replacingMatches(of: "([A-Z]+)([A-Z][a-z])", with: "$1_$2")
            .replacingMatches(of: "([a-z\\d])([A-Z])", with: "$1_$2")
            .replacingMatches(of: "-", with: "_")
            .lowercased()
    }
}
