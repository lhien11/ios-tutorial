//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func sum(x : Int, y: Int) -> Int {
    return x + y
}
sum(x: 2, y: 5)

var sumClosure: (Int, Int) -> (Int) = { a, b in
    return a * b
}

sumClosure(3, 4)
