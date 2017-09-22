//: Playground - noun: a place where people can play

import UIKit

var result: UInt = 1
func factorialOfValue(value: UInt) -> UInt { // value is of type let
    for index in 1...value{
        result = result * index
    }

    return result
}

print(factorialOfValue(value: 5))

//class Node<T> {
//    var value: T
//    var leftChild: Node?
//    var rightChild: Node?
//    
//    init(value: T){
//        self.value = value
//    }
//}
//
//enum BinaryTree<T> {
//    case empty
//    indirect case node(BinaryTree, T, BinaryTree)
//}
//
//// leaf nodes
//let node5 = BinaryTree.node(.empty, "5", .empty)
//let nodeA = BinaryTree.node(.empty, "a", .empty)
//let node10 = BinaryTree.node(.empty, "10", .empty)
//let node4 = BinaryTree.node(.empty, "4", .empty)
//let node3 = BinaryTree.node(.empty, "3", .empty)
//let nodeB = BinaryTree.node(.empty, "b", .empty)
//
//// intermediate nodes on the left
//let Aminus10 = BinaryTree.node(nodeA, "-", node10)
//let timesLeft = BinaryTree.node(node5, "*", Aminus10)
//
//// intermediate nodes on the right
//let minus4 = BinaryTree.node(.empty, "-", node4)
//let divide3andB = BinaryTree.node(node3, "/", nodeB)
//let timesRight = BinaryTree.node(minus4, "*", divide3andB)
//
//// root node
//let tree = BinaryTree.node(timesLeft, "+", timesRight)
