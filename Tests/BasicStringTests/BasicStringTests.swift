import XCTest
@testable import BasicString

final class BasicStringTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }

    static var allTests = [
        ("testExample", testExample),
		("testInitializers", testInitializers),
		("testSubscript", testSubscript),
		("testAddition", testAddition)
    ]
	
	func testInitializers() {
		var string: BasicString<Int>
		
		string = BasicString<Int>()
		XCTAssertEqual(string.capacity, 0)
		
		string = BasicString<Int>(12)
		XCTAssertEqual(string.capacity, 12)
		
		string = BasicString<Int>(0xF, size: 12)
		XCTAssertEqual(string.capacity, 13)
	}
	
	func testSubscript() {
		let string: BasicString<Int> = BasicString<Int>(0xF00F, size: 10)
		for index in 0..<string.length {
			XCTAssertEqual(string[index], 0xF00F)
		}
	}
	
	func testAddition() {
		var string: BasicString<Int> = BasicString<Int>(0xFFFF, size: 4)
		let addition = BasicString<Int>(0x0, size: 1)
		string += addition
		XCTAssertEqual(string[3], 0xFFFF)
		XCTAssertEqual(string[4], 0x0)
	}
}
