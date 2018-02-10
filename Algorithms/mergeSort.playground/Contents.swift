//: Playground - noun: a place where people can play

import UIKit
func mergeSort<T:Comparable>(_ array:[T]) -> [T]{
    guard array.count>1 else{
        return array
    }
    let middleIndex = array.count/2
    var leftArray = Array(array[0..<middleIndex])
    var rightArray = Array(array[middleIndex..<array.count])
    leftArray = mergeSort(leftArray)
    rightArray = mergeSort(rightArray)
    //merge here
    return merge(leftArray: leftArray, rightArray: rightArray)

}
func merge<T:Comparable>(leftArray:[T], rightArray:[T]) -> [T]{
    var leftIndex = 0
    var rightIndex = 0
    var resultArray:[T] = []
    while(leftIndex<leftArray.count && rightIndex<rightArray.count){
        if(leftArray[leftIndex]<rightArray[rightIndex]){
            resultArray.append(leftArray[leftIndex])
            leftIndex += 1
        }else if(leftArray[leftIndex]>rightArray[rightIndex]){
            resultArray.append(rightArray[rightIndex])
            rightIndex += 1
        }else{
            resultArray.append(leftArray[leftIndex])
            resultArray.append(rightArray[rightIndex])
            leftIndex += 1
            rightIndex += 1

        }
    }
    while(leftIndex<leftArray.count) {
        resultArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    while(rightIndex<rightArray.count) {
        resultArray.append(rightArray[rightIndex])
        rightIndex += 1
    }
    return resultArray
}
let testArray1 = [21,1,0,15,12,26,9,4,19,15]
print(mergeSort(testArray1))















