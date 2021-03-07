import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MyLibraryColorTests.allTests),
        testCase(MyLibraryNetworkingTest.allTests)
    ]
}
#endif
