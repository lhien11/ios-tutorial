//: Playground - noun: a place where people can play

import UIKit

let number = 643

var isPrime = true

var i = 2

while i < number {
    if number % i == 0 {
        isPrime = false
    }
    i += 1
}

print(isPrime)
