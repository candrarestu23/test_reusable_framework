import XCTest
@testable import MyLibrary

final class MyLibraryTests: XCTestCase {
    func testColorRedEqual() {
        let color = MyLibrary.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testColorAreEqual() {
        let color = MyLibrary.colorFromHexString("006736")
        XCTAssertEqual(color, MyLibrary.myColor)
    }
    
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testColorAreEQual", testColorAreEqual),
    ]
}
