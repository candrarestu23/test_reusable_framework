//
//  MyLibraryNetworkingTest.swift
//  MyLibraryTests
//
//  Created by Iglo-macpro on 08/03/21.
//

import XCTest
@testable import MyLibrary

class NetworkSessionMock: NetworkSession {

    var data: Data?
    var error: Error?
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
    
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
    
}

struct MockData: Codable, Equatable {
    var id: Int
    var name: String
}

final class MyLibraryNetworkingTest: XCTestCase {

    func testLoadDataCall(){
        let manager = MyLibrary.Networking.Manager()
        let session = NetworkSessionMock()
        manager.session = session
        let expectation = XCTestExpectation(description: "Called for data")
        let data = Data([0,1,0,1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertEqual(data, returnedData, "manager returned unexpected data")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testSendDataCall() {
        let session = NetworkSessionMock()
        let manager = MyLibrary.Networking.Manager()
        let sampleObject = MockData(id: 1, name: "test")
        let data = try? JSONEncoder().encode(sampleObject)
        session.data = data
        manager.session = session
        let url = URL(fileURLWithPath: "url")
        let expectation = XCTestExpectation(description: "sent Data")
        manager.sendData(to: url, body: sampleObject) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                let returnedObject = try? JSONDecoder().decode(MockData.self, from: returnedData)
                XCTAssertEqual(returnedObject, sampleObject)
                break
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
