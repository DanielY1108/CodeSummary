import UIKit

// MARK: - is 연산자

var score: Int = 100

score is Int
score is Double

var rating: Character = "A"

rating is Character
rating is String


//class Person {}
//class Developer: Person {}
//
//let danny = Developer()
//
//danny is Person
//danny is Developer


class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Developer: Person {}
class Doctor: Person {}


let people: [Person] = [
    Developer(name: "Danny"),
    Developer(name: "Jobs"),
    Doctor(name: "김사부")
]

//var developerCount = 0
//
//for person in people {
//    if person is Developer {
//        print("개발자 : \(person.name)")
//        developerCount += 1
//    } else if person is Doctor {
//        print("낭만닥터 : \(person.name)")
//    }
//}
//print("개발자의 수 : \(developerCount)명")

var developerCount = 0

for person in people {
    switch person {
    case is Developer:
        print("개발자 : \(person.name)")
        developerCount += 1
    case is Doctor:
        print("낭만닥터 : \(person.name)")
    default:
        break
    }
}
print("개발자의 수 : \(developerCount)명")


