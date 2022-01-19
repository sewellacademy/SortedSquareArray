//
//  main.swift
//  SortedSquareArray
//
//  Created by Dylan Sewell on 1/19/22.
//

import Foundation

class Program {
    // O(nlogn) time | O(n) space
    static func sortedSquareArray(_ array: [Int]) -> [Int] {
        var sortedSquares = Array(repeating: 0, count: array.count)
        
        for idx in stride(from: 0, to: array.count, by: 1) {
            let value = array[idx]
            sortedSquares[idx] = value * value
        }
        sortedSquares.sort()
        
        return sortedSquares
    }
    
    static func sortedSquareArray2(_ array: [Int]) -> [Int] {
        var sortedSquares = Array(repeating: 0, count: array.count)
        
        var smallerValueIdx = 0
        var largerValueIdx = array.count - 1
        
        for idx in stride(from: array.count - 1, through: 0, by: -1) {
            let smallerValue = array[smallerValueIdx]
            let largerValue = array[largerValueIdx]
            
            if abs(smallerValue) > abs(largerValue) {
                sortedSquares[idx] = smallerValue * smallerValue
                smallerValueIdx += 1
            } else {
                sortedSquares[idx] = largerValue * largerValue
                largerValueIdx -= 1
            }
        }
        return sortedSquares
    }
}

let arr = [1, 2, 3, 5, 6, 8, 9]
print(Program.sortedSquareArray(arr))
print(Program.sortedSquareArray2(arr))
