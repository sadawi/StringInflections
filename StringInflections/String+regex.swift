//
//  String+regex.swift
//  StringInflections
//
//  Created by Sam Williams on 12/2/16.
//  Copyright © 2016 Sam Williams. All rights reserved.
//

import Foundation

public extension String {
    func isMatched(by regex: NSRegularExpression) -> Bool {
        return regex.numberOfMatches(in: self, range: NSMakeRange(0, self.characters.count)) > 0
    }
    
    func replacingMatches(of regex: NSRegularExpression, options: NSRegularExpression.MatchingOptions = [], with template: String) -> String {
        return regex.stringByReplacingMatches(in: self, options: options, range: NSMakeRange(0, self.characters.count), withTemplate: template)
    }
    
    func replacingMatches(of pattern: String, options: NSRegularExpression.MatchingOptions = [], with template: String) -> String {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            return regex.stringByReplacingMatches(in: self, options: options, range: NSMakeRange(0, self.characters.count), withTemplate: template)
        } catch _ {
            return self
        }
    }
}
