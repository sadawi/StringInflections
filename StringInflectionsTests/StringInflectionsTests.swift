//
//  StringInflectionsTests.swift
//  StringInflectionsTests
//
//  Created by Sam Williams on 12/2/16.
//  Copyright © 2016 Sam Williams. All rights reserved.
//

import XCTest
import StringInflections

class StringInflectionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInflector() {
        var inflector = Inflector()
        inflector.inflect("dog", as: "dogz")
        
        XCTAssertEqual(inflector.apply(to: "camel"), "camel")
        XCTAssertEqual(inflector.apply(to: "dog"), "dogz")
    }
    
    func testUnderscore() {
        let string = "camelCaseExample"
        XCTAssertEqual(string.underscored(), "camel_case_example")
    }
    
    func testCamelCase() {
        let string = "camel_case_example"
        XCTAssertEqual(string.camelCased(uppercaseFirst: true), "CamelCaseExample")
        XCTAssertEqual(string.camelCased(uppercaseFirst: false), "camelCaseExample")

        XCTAssertEqual("random camel case".camelCased(), "randomCamelCase")
        XCTAssertEqual("This Was   Good".camelCased(), "thisWasGood")
    }
    
    func testPlural() {
        XCTAssertEqual("dog".pluralized(), "dogs")
        XCTAssertEqual("dog person".pluralized(), "dog people")
        XCTAssertEqual("matrix".pluralized(), "matrices")
        XCTAssertEqual("woman".pluralized(), "women")
        XCTAssertEqual("fireman".pluralized(), "firemen")
    }
    
    func testSingular() {
        XCTAssertEqual("dogs".singularized(), "dog")
        XCTAssertEqual("matrices".singularized(), "matrix")
        XCTAssertEqual("women".singularized(), "woman")
    }
    
    func testCustomInflections() {
        Inflector.pluralizer.inflect("chicken$", as: "people")
        XCTAssertEqual("chicken".pluralized(), "people")
    }
}
