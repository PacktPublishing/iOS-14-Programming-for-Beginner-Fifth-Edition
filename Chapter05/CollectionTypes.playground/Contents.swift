import UIKit

// arrays

var shoppingList = ["Eggs", "Milk"]

shoppingList.count
shoppingList.isEmpty

shoppingList.append("Cooking Oil")
shoppingList

shoppingList.insert("Chicken", at: 1)
shoppingList

shoppingList[2]

shoppingList[2] = "Soy Milk"
shoppingList

shoppingList.remove(at: 1)
shoppingList

for shoppingListItem in shoppingList {
    print(shoppingListItem)
}

for shoppingListItem in shoppingList[1...] {
    print(shoppingListItem)
}

// dictionaries

var contactList = ["Shah":"+60123456789", "Akhil":"+0223456789"]

contactList.count
contactList.isEmpty

contactList["Jane"] = "+0229876543"
contactList

contactList["Shah"]

contactList["Shah"] = "+60126789345"
contactList

contactList["Jane"] = nil
contactList

var oldDictValue = contactList.removeValue(forKey: "Akhil")
oldDictValue
contactList

for (name, contactNumber) in contactList {
    print("\(name) : \(contactNumber)")
}

// sets

var movieGenres: Set = ["Horror", "Action", "Romantic Comedy"]

movieGenres.count
movieGenres.isEmpty

movieGenres.insert("War")
movieGenres

movieGenres.contains("War")

var oldSetValue = movieGenres.remove("Action")
oldSetValue
movieGenres

for genre in movieGenres {
    print(genre)
}

let movieGenres2: Set = ["Science Fiction", "War", "Fantasy"]
movieGenres.union(movieGenres2)
movieGenres.intersection(movieGenres2)
movieGenres.subtracting(movieGenres2)
movieGenres.symmetricDifference(movieGenres2)

let movieGenresSubset: Set = ["Horror", "Romantic Comedy"]
let movieGenresSuperset: Set = ["Horror", "Romantic Comedy", "War", "Science Fiction", "Fantasy"]
let movieGenresDisjoint: Set = ["Bollywood"]
movieGenres == movieGenres2
movieGenresSubset.isSubset(of: movieGenres)
movieGenresSuperset.isSuperset(of: movieGenres)
movieGenresDisjoint.isDisjoint(with: movieGenres)
