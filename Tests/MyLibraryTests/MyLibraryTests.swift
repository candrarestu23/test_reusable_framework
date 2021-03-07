import XCTest
@testable import MyLibrary

final class MyLibraryTests: XCTestCase {
    func testColorRedEqual() {
        let color = MyLibrary.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
    ]
}
