import XCTest
@testable import MyLibrary

final class MyLibraryTests: XCTestCase {

    
    func testColorAreEqual() {
        let color = MyLibrary.colorFromHexString("006736")
        XCTAssertEqual(color, MyLibrary.myColor)
    }
    
    static var allTests = [
        ("testColorAreEQual", testColorAreEqual),
    ]
}
