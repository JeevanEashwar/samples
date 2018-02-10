//: Playground - noun: a place where people can play

import UIKit
func insertionSort<T>(_ inputArray: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var array = inputArray
    for index in 1...array.count-1{
        var revIndex = index-1
        let currentElement = array[index]
        while(revIndex >= 0 && isOrderedBefore(currentElement,array[revIndex])){
            array[revIndex+1] = array[revIndex]
            revIndex -= 1
        }
        revIndex += 1
        array[revIndex] = currentElement
    }
    return array
}
let arr1 = [5,2,4,1,3,6,8,7]
print(insertionSort(arr1,<))
let strings = ["Abhishek","Sandeep","Vamshi"]
print(insertionSort(strings,>))

