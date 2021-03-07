//
//  MyLibraryNetworkingTest.swift
//  MyLibraryTests
//
//  Created by Iglo-macpro on 08/03/21.
//

import XCTest
@testable import MyLibrary

final class MyLibraryNetworkingTest: XCTestCase {

    func testLoadDataCall(){
        let manager = MyLibrary.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        guard let url = URL(string: "https://raywenderlich.com") else {
            return XCTFail("Could not create URL properly")
        }
        
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData, "Response data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }

    static var allTest = [
        ("testLoadDataCall", testLoadDataCall)
    ]
}
