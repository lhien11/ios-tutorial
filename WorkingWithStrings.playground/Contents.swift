//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " Rob!"


let newTypeString = NSString(string: newString)

newTypeString.substring(to: 5)
newTypeString.substring(from: 4)

print(str.characters.count)
newTypeString.substring(from: str.characters.count + 1)




