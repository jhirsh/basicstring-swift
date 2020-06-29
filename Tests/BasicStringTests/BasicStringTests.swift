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
	
	func testFirstCharacter() {
		var string: BasicString<Int> = BasicString<Int>(0xF, size: 128)
		string += 0x0
		
		let firstZero = string.findFirstIndexOf(character: 0x0)
		XCTAssertEqual(firstZero, 128)
		
		let firstSixteen = string.findFirstIndexOf(character: 0xF)
		XCTAssertEqual(firstSixteen, 0)
	}
	
	func testFirstSequence() {
		var string: BasicString<Int> = BasicString<Int>(0xF, size: 4)
		let fourOnes = BasicString<Int>(0x1, size: 4)
		let twoTwos = BasicString<Int>(0x2, size: 2)
		let fourOnesOne256 = fourOnes + 0xFF
		
		string += fourOnes + twoTwos + fourOnesOne256
		
		let firstSequence = string.findFirstIndexOf(sequence: twoTwos)
		XCTAssertEqual(firstSequence, 8)
		
		let secondSequence = string.findFirstIndexOf(sequence: twoTwos + fourOnesOne256)
		XCTAssertEqual(secondSequence, 8)
		
		let thirdSequence = string.findFirstIndexOf(sequence: fourOnesOne256)
		XCTAssertEqual(thirdSequence, 10)
	}
	
	func testEqualsOperator() {
		let string1: BasicString<Int> = BasicString<Int>(0xF, size:10)
		var string2: BasicString<Int> = BasicString<Int>(0xF, size:9)
		
		XCTAssertNotEqual(string1, string2)
		
		string2 += 0xF
		
		XCTAssertEqual(string1, string2)
		
		string2 = BasicString<Int>(0xFF, size: 10)
		
		XCTAssertNotEqual(string1, string2)
	}
}
