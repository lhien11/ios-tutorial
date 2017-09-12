//: Playground - noun: a place where people can play

import UIKit

//let magicNum: UInt32 = arc4random_uniform(10)
//var guess: UInt32 = 0

//repeat {
//    print("Guess : \(guess)")
//    guess += 1
//} while (magicNum != guess)
//
//print("Magic Number was \(magicNum)")

// ---- DICTIONARIES ----
var dict1 = [Int: String]()

// Check if empty 
dict1[1] = "Paul Smith"

// Create a dictionary witha  string key 
var cust: [String: String] = ["1": "Sally Marks", "2": "Paul Mark"]

// Size of dictionary 
print("Size : \(cust.count)")

// Add an item 
cust["3"] = "Doug Holmes"

// Change a value 
cust["3"] = "Doug Marks"


if let name = cust["3"] {
    print("Index 3 : \(name)")
}

// remove a key value pair 
cust["3"] = nil

// Iterate through a dictionary 
for (key, value) in cust {
    print("\(key) : \(value)")
}

// --- TUPLES --- 
// tuples are finite gorup of vlaues that are related

let height: Double = 6.25
let weight: Int = 175

// Create a tuple 
let myData = (height, weight)

// Access values 
print("Height : \(myData.0)")
print("Weight : \(myData.1)")

// You can name values 
let myData2 = (height: 6.25, weight: 175)
print("Weight : \(myData2.weight)")

// ----- OPTIONAL -----
// Optionals are used to indicate that there may 
// not be a value. Everything that can have a 
// value of nil should be declared optional 

// Declare an optional 
var politicalParty: String?
politicalParty = "Independent"

// Check for nil 
if politicalParty != nil {
    // Get the value (Forced Unwrapping)
    let party = politicalParty!
    print("Party : \(party)")
}

// Optional binding is used to check if an optional 
// has a value 

if let party = politicalParty {
    print("Party : \(party)")
} else {
    print("No party")
}

// If nil use coalescing operator to assign a value 
let party = politicalParty ?? "No Party"

// ----- FUNCTIONS -----

// Define your parameter types 
func getSum(num1: Int, num2: Int){
    print("Sum : \(num1 + num2)")
}

getSum(num1: 2, num2: 5)

// Define your return type and you can define 
// default value

func getSum2(num1: Int, num2: Int = 1) -> Int {
    return num1 + num2
}

print("Sum : \(getSum2(num1: 8))")

// A variadic parameter allows for an unknown 
// number of parameters 
func getSum3(nums: Int...) -> Int{
    var sum: Int = 0
    for num in nums {
        sum += num
    }
    return sum
}

print("Sum : \(getSum3(nums: 1, 2, 3, 4, 5, 6))")

// Nested functions are only callable by the enclosing 
// function 

func doMath(num1: Double, num2: Double) {
    func mult() -> Double {
        return num1 / num2
    }
    print("Mult : \(mult())")
}

doMath(num1: 5.0, num2: 6.0)

// Return multiple values 
func twoMults(num: Int) -> (two: Int, three: Int) {
    let two: Int = num * 2
    let three: Int = num * 3
    return (two, three)
}

let mults = twoMults(num: 2)

print("2 Mults : \(mults.two), \(mults.three)")

// ---- CLOSURES -----
// Closures are functions that don't require a name 
// or function definition 

// A Closure that excepts and returns an Int 
var square: (Int) -> (Int) = {
    num in
    return num * num
}

print("5 Squared : \(square(5))")

// Assign a closure to another variable 
var squareCopy = square
print(" 5 Squared : \(squareCopy(5))")

// You can reference any values outside the closure 
let numbers = [8, 9, 2, 4, 1, 0, 7]

// Create a function that returns a bool stating 
// if 1 value is greater then the other 

let sortedNum = numbers.sorted(by: {
    x, y in x < y
})

for i in sortedNum {
    print(i)
}

// Square every item in an array with map 
// map excepts a closure 

let squareNums = numbers.map {
    (num: Int) -> String in
    "\(num * num)"
}

// Return a function 
func funcMaker(val: Int) -> (Int) -> Int {
    func addVals(num1: Int) -> Int {
        return num1 + val
    }
    return addVals
}

let add4 = funcMaker(val: 4)
print("4 + 5 = \(add4(5))")

func doMath2(_ mathFunc: (Int, Int) -> Int, val: Int) {
    print("sum : \(mathFunc(val, val))")
}

func addNums(a: Int, b: Int) -> Int {
    return a + b
}















