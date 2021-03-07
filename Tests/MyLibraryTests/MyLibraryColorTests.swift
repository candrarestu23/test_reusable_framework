import XCTest
@testable import MyLibrary

final class MyLibraryColorTests: XCTestCase {

    
    func testColorAreEqual() {
        let color = MyLibrary.Color.fromHexString("006736")
        XCTAssertEqual(color, MyLibrary.Color.myColor)
    }
    
    func testSecondColorAreEqual() {
        let color = MyLibrary.Color.fromHexString("FCFFFD")
        XCTAssertEqual(color, MyLibrary.Color.secondaryMyColor)
    }
    
    static var allTests = [
        ("testColorAreEQual", testColorAreEqual),
        ("testSecondColorAreEqual", testSecondColorAreEqual),
    ]
}
