//
//  CoffeeBreakTests.swift
//  CoffeeBreakTests
//
//  Created by Patrick Rugebregt on 06/01/2022.
//

import XCTest
@testable import CoffeeBreak

class CoffeeBreakTests: XCTestCase {

    var sut: HowManyCoffees?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HowManyCoffees()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testOutcome() throws {
        for i in 1...4 {
            switch i {
            case 1:
                XCTAssert(sut?.warning == WarningMessage.one.rawValue)
            case 2:
                XCTAssert(sut?.warning == WarningMessage.two.rawValue)
            case 3:
                XCTAssert(sut?.warning == WarningMessage.three.rawValue)
            case 4...Int.max:
                XCTAssert(sut?.warning == WarningMessage.four.rawValue)
            default:
                XCTAssert(sut?.warning == WarningMessage.one.rawValue)
            }
            sut?.count += 1
        }
    }


}
