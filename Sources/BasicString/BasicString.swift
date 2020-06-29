// BasicString.swift

struct BasicString<T> where T: BinaryInteger {
	var array: Array<T>
	var capacity: Int // TODO: restrict public access to get
	var length: Int
	
	init() {
		capacity = 0
		length = 0
		
		array = Array<T>()
	}
	
	init(_ capacity: Int) {
		self.capacity = capacity
		length = 0

		array = Array<T>()
		array.reserveCapacity(capacity)
	}
	
	init(_ character: T, size: Int) {
		self.init(size + 1)
		length = size
		for _ in 0..<size {
			array.append(character)
		}
	}
	
	init(_ other: BasicString<T>) {
		capacity = other.capacity
		length = other.length
		array = other.array
	}
	
	subscript(index: Int) -> T {
		return self.array[index]
	}
}
