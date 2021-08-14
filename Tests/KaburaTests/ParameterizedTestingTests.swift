//
//  ParameterizedTestingTests.swift
//  
//
//  Created by Ryoichi Izumita on 2021/06/28.
//

import XCTest
@testable import Kabura

class ParameterizedTestingTests: XCTestCase {
    func testParameterizedTesting() {
        let arg2E = params {
            "" | 0 => "0"
            "a" | 1 => "a1"
            "ab" | 2 => "ab2"
        }

        verify(arg2E) { a, b, expect in
            XCTAssertEqual(a + String(b), expect)
        }

        let arg2EL = params {
            l("" | 0 => "0")
            l("a" | 1 => "a1")
            l("ab" | 2 => "ab2")
        }

        verify(arg2EL) { a, b, expect, line in
            XCTAssertEqual(a + String(b), expect, line: line)
        }

        verify {
            "" | 0 => "0"
            "a" | 1 => "a1"
            "ab" | 2 => "ab2"
        } test: { a, b, expect in
            XCTAssertEqual(a + String(b), expect)
        }
    }
}
