//: Playground - noun: a place where people can play

import UIKit
import Foundation


func isUnique(_ input: String) -> Bool {
    var checkLetter = [Character]()
    for letter in input.characters {
        if checkLetter.contains(letter) {
            return false
        }
        checkLetter.append(letter)
    }
    
    return true
}

print(isUnique("AaBbCc"))

