import UIKit

// Variables are declared with "var" and can change.
var str = "Hello, playground"
str = "Hello, Swift"

// Constants are declared with "let" and cannot change
let constantStr = str
// If we try to change the value of a let, that's an error
// constantStr = "Hello, world"

var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

//var arrayOfInts: Array<Int>
var arrayOfInts: [Int]
//var dictionaryOfCapitalsByCountry: Dictionary<String,String>
var dictionaryOfCapitalsByCountry: [String:String]

var winningLotteryNumbers: Set<Int>

let number = 42
let fmStation = 91.1

//let countingUp = ["one", "two"]
var countingUp = ["one", "two"]
countingUp.append("three")
let nameByParkingSpace = [13: "Alice", 27: "Bob"]

let secondElement = countingUp[1]
countingUp.count


//let crashBoom = countingUp[2]

let emptyString = String()
emptyString.isEmpty
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultInt = Int()
let defaultBool = Bool()

let meaningOfLife = String(number)

let availableRooms = Set([205, 411, 412])

let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)

let floatingPi: Float = 3.14


var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

// We cannot use them directly - optionals must be unwrapped
//let averageReading = (reading1 + reading2 + reading3) / 3

// We can force-unwrap them
// Force-unwrapping should ONLY be used when you KNOW the value is not nil
//let averageReading = (reading1! + reading2! + reading3!) / 3

// We can also use optional binding
if let r1 = reading1, let r2 = reading2, let r3 = reading3 {
    let averageReading = (r1 + r2 + r3) / 3
} else {
    print("One of the readings was nil.")
}

//let space13Assignee = nameByParkingSpace[13]
let space42Assignee = nameByParkingSpace[42]

if let space13Assignee = nameByParkingSpace[13] {
    print("Key 13 is present in the dictionary")
} else {
    print("Key 13 is NOT present in the dictionary")
}

// Three different ways of doing for loops
for i in 0..<countingUp.count {
    print("countingUp[\(i)] = \(countingUp[i])")
}

for str in countingUp {
    print("countingUp[] = \(str)")
}

// The (i, str) is a "tuple"
for (i, str) in countingUp.enumerated() {
    print("countingUp[\(i)] = \(str)")
}

// You can use .enumerated() on dictionaries, too
for (space, name) in nameByParkingSpace.enumerated() {
    let permit = "Space \(space): \(name)"
    print(permit)
}

// The "\()" syntax in a string is "string interpolation"

enum PieType: Int {
    case apple // Automatically assigned a raw value of 0
    case cherry  // Automatically assigned a raw value of last enum rawValue + 1  = 1
    case pecan   // Automatically assigned a raw value of last enum rawValue + 1  = 2
}

let favoritePie = PieType.apple

let name: String
switch favoritePie {
case .apple:
    name = "apple"
case .cherry:
    name = "cherry"
case .pecan:
    name = "pecan"
}

let pieRawValue = PieType.pecan.rawValue

let intValue = 1
if let pieType = PieType(rawValue: intValue) {
    print("\(intValue) is a valid raw value for PieType")
} else {
    print("\(intValue) is NOT a valid raw value for PieType")
}

// This book is the definitive guide to Swift
// https://docs.swift.org/swift-book/
//
// This is the guide for the Swift Standard Library
// https://developer.apple.com/documentation/swift/swift_standard_library



