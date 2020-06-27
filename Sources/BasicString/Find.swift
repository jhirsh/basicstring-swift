//
//  File.swift
//  
//
//  Created by Jonas Hirshland on 6/27/20.
//

import Foundation

extension BasicString<T> where T: BinaryInteger {
	// MARK: - Find First Occurrences
	
	func findFirstIndexOf(character: T) -> Int? {
		for index in 0..<length {
			if array[index] == character { return index }
		}
		return nil
	}
	
	func findFirstIndexOf(sequence: BasicString<T>) -> Int? {
		for index in 0..<length-sequence.length+1{
			if self.array[index] == sequence[0] {
				var isMatch = true
				
				for j in 1..<sequence.length {
					if self.array[index+j] != sequence.array[j] {
						isMatch = false
						break
					}
				}
				
				if isMatch { return index }
			}
		}
		
		return nil
	}
	
	// MARK: - Find Kth Occurrences
	
	// func findKthOccurenceOf(character: T, kth: Int) -> Int?
	
	// func findKthOccurrenceOf(sequence: T, kth: Int) -> Int?
}
