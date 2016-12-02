//
//  StringInflectionsTests.swift
//  StringInflectionsTests
//
//  Created by Sam Williams on 12/2/16.
//  Copyright © 2016 Sam Williams. All rights reserved.
//

import XCTest
@testable import StringInflections

class StringInflectionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUnderscore() {
        let string = "camelCaseExample"
        XCTAssertEqual(string.underscored(), "camel_case_example")
    }
    
    func testCamelCase() {
        let string = "camel_case_example"
        XCTAssertEqual(string.underscored(), "camelCaseExample")
    }
    
}
