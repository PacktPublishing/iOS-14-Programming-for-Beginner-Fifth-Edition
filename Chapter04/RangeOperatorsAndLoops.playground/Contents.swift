import UIKit

// range operators
// closed range operator

let myRange = 10...20

// half-open range operator

let myRange2 = 10..<20

// loops
// for loop

for number in myRange2 {
    print(number)
}

for number in (0...5).reversed() {
    print(number)
}

// while loop

var y = 0
while y < 50 {
    y += 5
    print("y is \(y)")
}

// repeat loop

var x = 0
repeat {
    x += 5
    print("x is \(x)")
} while x < 50
