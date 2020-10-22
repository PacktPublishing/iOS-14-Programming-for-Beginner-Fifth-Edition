import UIKit

// range operators

let myRange = 10...20
let myRange2 = 10..<20

// loops

/*
for number in myRange {
    print(number)
}
 */

for number in myRange2 {
    print(number)
}

/*
for number in 0...5 {
    print(number)
}
 */

for number in (0...5).reversed() {
    print(number)
}

var y = 0
// y = 100
while y < 50 {
    y += 5
    print("y is \(y)")
}

var x = 0
// x = 100
repeat {
    x += 5
    print("x is \(x)")
} while x < 50
