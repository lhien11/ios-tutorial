//: Playground - noun: a place where people can play

import UIKit


func doMath2(_ mathFunc: (Int, Int) -> Int, val: Int) {
    print("sum : \(mathFunc(val, val))")
}

func addNums(a: Int, b: Int) -> Int {
    return a + b
}

doMath2(addNums, val: 5)

// ---- FILTER ----
// Used to filter out values in an array 
let num2 = [1, 2, 3, 4, 5, 6]

let evenNums = num2.filter {
    (num: Int) -> Bool in
    return num % 2 == 0
}

print(evenNums)

// --- REDUCE ---
// reduces array values into one value 
let sum2 = num2.reduce(0) {
    (x: Int, y: Int) -> Int in
    return x + y
}

print(sum2)

// ----- ENUMBERATIONS -----
// Define types with a limited number of cases

enum Emotion {
    case joy
    case anger
    case fear
    case digust
    case sad
}

var feeling = Emotion.joy

// change the value 
feeling = .anger

print("Angry : \(feeling == .anger)")

// ---- STRUCTS ------
// Structs group related data together 
struct Rectangle {
    var height = 0.0
    var length = 0.0
    
    // You can include functions
    func area() -> Double{
        let area = height * length
        return area
    }
}

// Create a Rectangle 
let myRect = Rectangle(height: 10.0, length: 5.0)

print("Area : \(myRect.height) * \(myRect.length) = \(myRect.area())")



