//: Playground - noun: a place where people can play

import UIKit
import Darwin

var str = "Hello, playground"

// You can define it is a string
var world: String = "World"

print("Hello \(world)")

// Declare an int
var age: Int = 17

// Min and Max Integer Size
print("Min Double \(DBL_MIN)")
print("Max Double \(DBL_MAX)")

print("Max Float \(Float.greatestFiniteMagnitude)")

var canVote: Bool = true
var myGrade: Character = "A"

var three: Double = 3.0
var two: Int = 2

var five = three + Double(two)
print(five)
// Cast to Int 
print("3 : \(Int(3.14))")

if age < 5 {
    print("Go to Preschool")
} else if (age == 5) {
    print("Go to kindergarden")
} else if (age > 5 && age < 18) {
    var grade: Int = age - 5
    print("Go to Grade \(grade)")
} else {
    print("Go to college")
}

// Or logical operator 

var income: Double = 120000
var gpa: Double = 3.7

print("Get Grant : \((income < 15000) || (gpa >= 3.8))")
print(" ")

// Not operator 
print("Not True : \(!true)")

// Ternary operator
var canDrive: Bool = age > 16 ? true : false

print("I can drive = \(canDrive)")

let ingredient = "pasta"

switch ingredient {
    // Matches for tomatoes or pasta
    case "tomatoes", "pasta":
        print("Spaghetti")
        // fallthrough matches the next case even if
        // there is no match
    case "beans":
        print("Burrito")
    case "potatoes":
        print("Mashed Potatoes")
    default:
        print("water")
}

// You can also match ranges
let testScore: Int = 89

switch testScore {
    case 93...100:
        print("You got an A")
    case 85...92:
        print("You got a B")
    case 77...84:
        print("You got a C")
    case 69...76:
        print("You got a D")
    default:
        print("You got an F")
}

// ---- Math ----- 
print("5 + 4 = \(5+4)")
print("5 - 4 = \(5-4)")
print("5 * 4 = \(5*4)")
print("5.0 / 4.0 = \(5.0/4.0)")
print("5 % 4 = \(5%4)")

// --- Order of Operations -----
print("4 + 5 * 10 = \(4 + 5 * 10)")

// Shortcuts
var randNum: Int = 5
randNum += 1
randNum -= 1

// You cannot do randNum++ in Swift 3?

// Math Functions 
print("abs(-5) = \(abs(-5))")
print("floor(5.5) = \(floor(5.5))")
print("ceil(5.5) = \(ceil(5.5))")
print("log(2.71828) = \(log(2.71828))")

// There is also sin, cos, tan asin, acos, atan
// sinh cosh, tanh

// ---- STRINGS -----
// A string of characters that are passed by value 
// Escape Characters : \\ \t \n \" \' 
var randStr = "This is a random string"
var randStr2 = " and here is another"

// Join strings 
var randStr3 = randStr + randStr2
print("Length : \(randStr3.characters.count)")

// Get the first character
print("First : \(randStr3[randStr3.startIndex])")

// Get the 5th character
let index5 = randStr3.index(randStr3.startIndex, offsetBy: 5)
print("5th : \(randStr3[index5])")

// Check if a string is empty
print("Empty : \(randStr3.isEmpty)")
// Insert a character at an index
randStr2.insert("A", at: randStr2.startIndex)
randStr2.insert(contentsOf: "string ".characters, at: randStr2.index(randStr2.startIndex, offsetBy: 2))
print(randStr2)

// Get a substring 
let startIndex = randStr2.index(randStr2.startIndex, offsetBy: 2)
let endIndex = randStr2.index(randStr2.startIndex, offsetBy: 9)
let stringRange = startIndex ..< endIndex
let subStr = randStr2.substring(with: stringRange)

// Replace a string 
// Check if there is a match 

if let hereMatch = randStr2.range(of: "here"){
    randStr2.replaceSubrange(hereMatch, with: "there")
}
print(randStr2)

// --- ARRAYS ---
// Store values of the same type

var array1 = [Int]()

// Check if array is empty
print("Empty \(array1.isEmpty)")

// Add value to array 
array1.append(5)
print(array1)
array1 += [7, 9]
print(array1)

// change multiple values 
array1[0...2] = [1, 2, 3]
print(array1)

// Length of array 
print("Length : \(array1.count)")

// Fill array with a value 
var array2 = Array(repeating: 0, count: 5)
print(array2)

for (index, value) in array2.enumerated() {
    print("\(index) : \(value)")
}

for item in array1 {
    print(item)
}

for i in 1...5{
    print(i)
}

for i in 1...10 where i % 2 == 0 {
    print("Even : \(i)")
}

// ----- WHILE LOOP ------
var i: Int = 1
while i < 10 {
    if i % 2 == 0 {
        i += 1
        // Continue jumps back to the beginning of the loop
        continue
    }
    
    if i == 7 {
        // Break ends the loop
        break
    }
    print(i)
    i += 1
}

// --- REPEAT WHILE ----

// Generate a random number 
let magicNum: UInt32 = arc4random_uniform(10)
var guess: UInt32 = 0
//
//repeat {
//    print("Guess : \(guess)")
//    guess += 1
//} while (magicNum != guess)
//
//print("Magic Number was /(magicNum")














