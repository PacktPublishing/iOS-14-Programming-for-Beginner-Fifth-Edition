import UIKit

// Protocols

protocol CalorieCountProtocol {
    var calories: Int { get }
    func description() -> String
}

class Burger : CalorieCountProtocol {
    let calories = 800
    func description() -> String {
        return "This burger has \(calories) calories"
    }
}

struct Fries : CalorieCountProtocol {
    let calories = 500
    func description() -> String {
        return "These fries have \(calories) calories"
    }
    
}

// Extensions

enum Sauce {
    case chili
    case tomato
}

extension Sauce : CalorieCountProtocol {
    var calories: Int {
        switch self {
        case .chili:
            return 20
        case .tomato:
            return 15
        }
    }
    func description() -> String {
        return "This sauce has \(calories) calories"
    }
}

let burger = Burger()
let fries = Fries()
let sauce = Sauce.tomato
let foodArray : [CalorieCountProtocol] = [burger, fries, sauce]

var totalCalories = 0
for food in foodArray {
    totalCalories += food.calories
}
print(totalCalories)

// Error Handling

enum WebpageError: Error {
    case success
    case failure(Int)
}

func getWebpage(uRL: String, siteUp: Bool) throws -> String {
    if siteUp == false {
        throw WebpageError.failure(404)
    }
    return "Success"
}
let webpageURL = "http://www.apple.com"
let webSiteUp = false
do {
    let status = try getWebpage(uRL: webpageURL, siteUp: webSiteUp)
    print(status)
} catch {
    print(error)
}
