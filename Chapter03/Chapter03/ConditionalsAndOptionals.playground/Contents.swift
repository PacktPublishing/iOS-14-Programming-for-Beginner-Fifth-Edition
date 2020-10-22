import UIKit

//Conditionals

let isPictureVisible = true
if isPictureVisible {
    print("Picture is visible")
}

let drinkingAgeLimit = 21
var customerAge = 23
if customerAge < drinkingAgeLimit {
    print("Under age limit")
} else {
    print("Over age limit")
}


 var trafficLight = "Yellow"
 if trafficLight == "Red" {
    print("Stop")
 } else if trafficLight == "Yellow" {
    print("Caution")
 } else if trafficLight == "Green" {
    print("Go")
 } else {
    print("Invalid Color")
 }

trafficLight = "Yellow"
switch trafficLight {
case "Red":
    print("Stop")
case "Yellow":
    print("Caution")
case "Green":
    print("Go")
default:
    print("Invalid color")
}

// Optionals

var spouseName: String?
// spouseName = nil
spouseName = "Nia"
print(spouseName)
if let spouse = spouseName {
    let greeting = "Hello, " + spouse
    print(greeting)
}
