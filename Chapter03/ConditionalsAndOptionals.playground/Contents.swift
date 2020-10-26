import UIKit

let isPictureVisible = false
if isPictureVisible {
    print("Picture is visible")
}

let isRestaurantFound = true
if isRestaurantFound == false {
    print("Restaurant was not found")
}

let drinkingAgeLimit = 21
var customerAge = 19
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

var spouseName: String?
spouseName = nil
print(spouseName)
if let spouse = spouseName {
    let greeting = "Hello, " + spouse
    print(greeting)
}

