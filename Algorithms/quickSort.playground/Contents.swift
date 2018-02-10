//: Playground - noun: a place where people can play

import UIKit
//basic quick sort by selecting center element as pivot
func naiveQuickSort<T:Comparable>(_ a:[T]) -> [T]{
    guard a.count>1 else { return a }
    //select a pivot
    let pivot = a[a.count/2]
    let less = a.filter{$0<pivot}
    let equal = a.filter{$0==pivot}
    let greater = a.filter{$0>pivot}
    return naiveQuickSort(less)+equal+naiveQuickSort(greater)
}
//let arr = [3,6,4,9,7,2,5,1,6,4,8]
//print(naiveQuickSort(arr))

//quick sort using Lomuto's partitioning scheme
func lomuntoPartition<T:Comparable>(_ array:inout [T], low:Int, high:Int) -> Int{
    let pivot = array[high]
    var i = low
    for j in low..<high {
        if(array[j] <= pivot){
            (array[i],array[j]) = (array[j],array[i])
            i += 1
        }
    }
    (array[i],array[high]) = (array[high],array[i])
    return i
}

func quickSortWithlomunto<T:Comparable>(_ a:inout [T], low:Int , high:Int){
    if(low<high){
        let pivotIndex = lomuntoPartition(&a, low: low, high: high)
        quickSortWithlomunto(&a, low: low, high: pivotIndex-1)
        quickSortWithlomunto(&a, low: pivotIndex+1, high: high)
    }
}
var arr2 = [10,21,12,14,9,17,20,13,16,11]
print("before sort: \(arr2)")
quickSortWithlomunto(&arr2, low: 0, high: arr2.count-1)
print("after sort: \(arr2)")
