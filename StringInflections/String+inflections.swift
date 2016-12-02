//
//  String+inflections.swift
//  StringInflections
//
//  Created by Sam Williams on 12/2/16.
//  Copyright © 2016 Sam Williams. All rights reserved.
//

import Foundation

//struct Inflector {
//    static let defaultInflector = Inflector()
//}

public struct Inflection {
    public var pattern: NSRegularExpression
    public var ouput: String
    
    public func apply(to string: String) -> String {
        return string.replacingMatches(of: self.pattern, with: self.ouput)
    }
}

public struct Inflector {
    var inflections: [Inflection] = []
    
    public init() {
    }
    
    public func apply(to string: String) -> String {
        var output = string
        for inflection in self.inflections {
            if string.isMatched(by: inflection.pattern) {
                output = inflection.apply(to: output)
                return output
            }
        }
        return output
    }
    
    public mutating func inflect(_ pattern: String, as output: String) {
        if let rule = try? NSRegularExpression(pattern: pattern) {
            self.inflect(rule, as: output)
        }
    }

    public mutating func inflect(_ rule: NSRegularExpression, as output: String) {
        self.inflections.append(Inflection(pattern: rule, ouput: output))
    }
}

public extension Inflector {
    static let pluralizer: Inflector = {
        var inflector = Inflector()
        inflector.inflect("(matr|vert|ind)(?:ix|ex)$", as: "$1ices")
        inflector.inflect("(m)an$", as: "$1en")
        inflector.inflect("(pe)rson$", as: "$1ople")
        inflector.inflect("(child)$", as: "$1ren")
        inflector.inflect("^(ox)$", as: "$1en")
        inflector.inflect("(ax|test)is$", as: "$1es")
        inflector.inflect("(octop|vir)us$", as: "$1i")
        inflector.inflect("(alias|status)$", as: "$1es")
        inflector.inflect("(bu)s$", as: "$1ses")
        inflector.inflect("(buffal|tomat|potat)o$", as: "$1oes")
        inflector.inflect("([ti])um$", as: "$1a")
        inflector.inflect("sis$", as: "ses")
        inflector.inflect("(?:([^f])fe|([lr])f)$", as: "$1$2ves")
        inflector.inflect("(hive)$", as: "$1s")
        inflector.inflect("([^aeiouy]|qu)y$", as: "$1ies")
        inflector.inflect("(x|ch|ss|sh)$", as: "$1es")
        inflector.inflect("([m|l])ouse$", as: "$1ice")
        inflector.inflect("(quiz)$", as: "$1zes")
        inflector.inflect("(cow)$", as: "kine")
        inflector.inflect("s$", as: "s")
        inflector.inflect("$", as: "s")
        return inflector
    }()
    
    static let singularizer: Inflector = {
        var inflector = Inflector()
        inflector.inflect("(database)s$", as: "$1")
        inflector.inflect("(m)en$", as: "$1an")
        inflector.inflect("(pe)ople$", as: "$1rson")
        inflector.inflect("(child)ren$", as: "$1")
        inflector.inflect("(n)ews$", as: "$1ews")
        inflector.inflect("([ti])a$", as: "$1um")
        inflector.inflect("((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$", as: "$1$2sis")
        inflector.inflect("(^analy)ses$", as: "$1sis")
        inflector.inflect("([lr])ves$", as: "$1f")
        inflector.inflect("([^f])ves$", as: "$1fe")
        inflector.inflect("(hive)s$", as: "$1")
        inflector.inflect("(tive)s$", as: "$1")
        inflector.inflect("(curve)s$", as: "$1")
        inflector.inflect("([^aeiouy]|qu)ies$", as: "$1y")
        inflector.inflect("(s)eries$", as: "$1eries")
        inflector.inflect("(m)ovies$", as: "$1ovie")
        inflector.inflect("(x|ch|ss|sh)es$", as: "$1")
        inflector.inflect("([m|l])ice$", as: "$1ouse")
        inflector.inflect("(bus)es$", as: "$1")
        inflector.inflect("(o)es$", as: "$1")
        inflector.inflect("(shoe)s$", as: "$1")
        inflector.inflect("(cris|ax|test)es$", as: "$1is")
        inflector.inflect("(octop|vir)i$", as: "$1us")
        inflector.inflect("(alias|status)es$", as: "$1")
        inflector.inflect("^(ox)en", as: "$1")
        inflector.inflect("(vert|ind)ices$", as: "$1ex")
        inflector.inflect("(matr)ices$", as: "$1ix")
        inflector.inflect("(quiz)zes$", as: "$1")
        inflector.inflect("s$", as: "")
        return inflector
    }()

}

public extension String {
    func pluralized() -> String {
        return Inflector.pluralizer.apply(to: self)
    }

    func singularized() -> String {
        return Inflector.singularizer.apply(to: self)
    }
}
