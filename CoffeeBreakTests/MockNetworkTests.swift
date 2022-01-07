//
//  MockNetworkTests.swift
//  CoffeeBreakTests
//
//  Created by Patrick Rugebregt on 07/01/2022.
//

import XCTest
@testable import CoffeeBreak

class MockNetworkTests: XCTestCase {

    var sut: MockNetwork?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MockNetwork()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testValidDataReturn() {
        sut?.fetchCoffee(completionHandler: { items in
            XCTAssert(items as Any is [CoffeeList.CoffeeItem])
        })
    }
    
    func testJsonData() {
        let data = sut?.fetchedCoffees
        XCTAssert(!data!.isEmpty)
    }

}
