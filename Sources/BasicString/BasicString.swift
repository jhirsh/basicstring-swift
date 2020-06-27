// BasicString.swift

struct BasicString<T> where T: BinaryInteger {
	private var array: Array<T>
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
	
	subscript(index: Int) -> T {
		return self.array[index]
	}
}
