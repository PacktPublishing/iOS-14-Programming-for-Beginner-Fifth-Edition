import UIKit

// functions

func serviceCharge(forMealPrice mealCost: Int) -> Int {
    return mealCost / 10
}

let serviceChargeAmount = serviceCharge(forMealPrice: 50)
print(serviceChargeAmount)

func calculateMonthlyPayments(carPrice: Double, downPayment: Double, interestRate: Double, paymentTerm: Double) -> Double {
    
    func loanAmount() -> Double {
        return carPrice - downPayment
    }
    
    func totalInterest() -> Double {
        return interestRate * paymentTerm
    }
    
    func noOfMonths() -> Double {
        return paymentTerm * 12
    }
    
    return ((loanAmount() + (loanAmount() * totalInterest() / 100 )) / noOfMonths())
}

calculateMonthlyPayments(carPrice: 50000, downPayment: 5000, interestRate: 3.5, paymentTerm: 7.0)

func makePi() -> ( () -> Double){
    func generatePi() -> Double {
        return 22.0 / 7.0
    }
    return generatePi
}
let pi = makePi()
print(pi())

func isThereAMatch(listOfNumbers: [Int], condition: (Int) -> Bool) -> Bool {
    for item in listOfNumbers {
        if condition(item) {
            return true
        }
    }
    return false
}

func oddNumber(number: Int) -> Bool {
    return (number % 2) > 0
}
var numbersList = [2, 4, 6, 7]
isThereAMatch(listOfNumbers: numbersList, condition: oddNumber(number:))

func buySomething(itemValueField: String, cardBalance: Int) -> Int {
    guard let itemValue = Int(itemValueField) else {
        print("error in item value")
        return cardBalance
    }
    let remainingBalance = cardBalance - itemValue
    return remainingBalance
}

print(buySomething(itemValueField: "10", cardBalance: 50))
print(buySomething(itemValueField: "blue", cardBalance: 50))

// closures

var numbersArray = [2, 4, 6, 7]
let myClosure = { (number: Int) -> Int in
    let result = number * number
    return result
}

let mappedNumbers = numbersArray.map(myClosure)

var testNumbers = [2, 4, 6, 7]
let mappedTestNumbers = testNumbers.map{
    $0 * $0
}
print(mappedTestNumbers)
