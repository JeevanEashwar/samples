//: Playground - noun: a place where people can play

import UIKit
enum BinaryTree<T: Comparable>{
    case empty
    indirect case node(BinaryTree,T,BinaryTree)
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count+1+right.count
        case .empty:
            return 0
        }
    }
    private func newTreeAfterInserting(newValue: T) -> BinaryTree{
        switch self {
        case .empty:
            return .node(.empty,newValue,.empty)
        case let .node(left, value, right):
            if(newValue<=value){
                //forward the new value to the left
                return .node(left.newTreeAfterInserting(newValue: newValue),value,right)
            }else{
                //forward the new value to the right
                return .node(left,value,right.newTreeAfterInserting(newValue: newValue))
            }
        }
    }
    mutating func insert(newValue: T){
        self = newTreeAfterInserting(newValue: newValue)
    }
    func traverseInOrder(process: (T) -> ()){
        switch self{
        case .empty:
            return
        case let .node(left,value,right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    func traversePreOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    func traversePostOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    func search(searchValue: T) -> BinaryTree?{
        switch self {
        case .empty:
            return nil
        case let .node(left,value,right):
            if(value == searchValue){
                return self
            }else if(searchValue < value){
                //go left
                return left.search(searchValue: searchValue)
            }
            else{
                //go right
                return right.search(searchValue: searchValue)
            }
        
        }
    }
}
extension BinaryTree : CustomStringConvertible{
    var description: String {
        switch self {
        case let .node(left, value, right) :
            return "value = \(value), left = [\(left.description)], right = [\(right.description)]"
        case .empty :
            return ""
        }
    }
}
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty,"4",.empty)
let node3 = BinaryTree.node(.empty,"3",.empty)
let nodeB = BinaryTree.node(.empty,"b",.empty)
let node5 = BinaryTree.node(.empty,"5",.empty)

let aMinus10 = BinaryTree.node(nodeA,"-", node10)
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3,"/",nodeB)

let leftMult = BinaryTree.node(node5, "*", aMinus10)
let rightMult = BinaryTree.node(minus4, "*", divide3andB)
let tree = BinaryTree.node(leftMult, "+", rightMult)

var binaryTree: BinaryTree<Int> = .empty
binaryTree.insert(newValue: 5)
binaryTree.insert(newValue: 1)
binaryTree.insert(newValue: 7)
binaryTree.insert(newValue: 4)
binaryTree.insert(newValue: 6)
binaryTree.insert(newValue: 9)
binaryTree.insert(newValue: 10)
//binaryTree.traverseInOrder{print($0)}
//binaryTree.traversePreOrder{print($0)}
//binaryTree.traversePostOrder{print($0)}
print(binaryTree.search(searchValue: 7))
