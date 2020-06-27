//
//  File.swift
//  
//
//  Created by Jonas Hirshland on 6/27/20.
//

import Foundation

extension BasicString<T> where T: BinaryInteger {
	
	static func + (lhs: BasicString<T>, rhs: BasicString<T>) -> BasicString<T>  {
		var newString = BasicString<T>(lhs.capacity + rhs.capacity)
		
		for index in 0..<lhs.length {
			newString.array.append(lhs[index])
		}
		
		for index in 0..<rhs.length {
			newString.array.append(rhs[index])
		}
		
		newString.length = lhs.length + rhs.length
		
		return newString
	}
	
	static func + (lhs: BasicString<T>, rhs: T) -> BasicString<T>  {
		var newString = BasicString<T>(lhs.capacity + 1)
		
		for index in 0..<lhs.length {
			newString.array.append(lhs[index])
		}
		
		newString.array.append(rhs)
		
		newString.length = lhs.length + 1
		
		return newString
	}
	
	static func += (lhs: inout BasicString<T>, rhs: BasicString<T>) {
		lhs.array.reserveCapacity(lhs.capacity + rhs.capacity)
		
		for index in 0..<rhs.length {
			lhs.array.append(rhs.array[index])
		}
		
		lhs.length += rhs.length
	}
	
	static func += (lhs: inout BasicString<T>, rhs: T) {
		lhs.array.append(rhs)
		lhs.length += 1
	}
}
