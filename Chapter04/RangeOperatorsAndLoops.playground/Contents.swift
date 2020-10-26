import UIKit

// Range operators

let myRange = 10...20
let myRange2 = 10..<20

// Loops

for number in (0...5).reversed() {
    print(number)
}

var y = 0
while y < 50 {
    y += 5
    print("y is \(y)")
}

var x = 0
repeat {
    x += 5
    print("x is \(x)")
} while x < 50
