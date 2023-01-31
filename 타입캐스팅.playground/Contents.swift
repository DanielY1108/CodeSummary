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


//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//class Developer: Person {}
//class Doctor: Person {}
//
//
//let people: [Person] = [
//    Developer(name: "Danny"),
//    Developer(name: "Jobs"),
//    Doctor(name: "김사부")
//]

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

//var developerCount = 0
//
//for person in people {
//    switch person {
//    case is Developer:
//        print("개발자 : \(person.name)")
//        developerCount += 1
//    case is Doctor:
//        print("낭만닥터 : \(person.name)")
//    default:
//        break
//    }
//}
//print("개발자의 수 : \(developerCount)명")



// MARK: - as 연산자

class Person {
    let name = "Danny"
    let age = 20
}

class Developer: Person {
    let skill = "Swift"
}


let person = Person()
person.name
person.age

//let danny = Developer()
//
//danny.name    // "Danny"
//danny.age     // 20
//danny.skill   // "Swift"

//let castingDanny = danny as Person


//let castingDanny: Person = danny
//castingDanny.name
//castingDanny.age

//let castingDanny: Person = danny

let caaaa = person as? Developer

//if let castingDeveloper = castingDanny as? Developer {
//    castingDeveloper.name
//    castingDeveloper.age
//    castingDeveloper.skill
//}
//
//let castingDeveloper = castingDanny as! Developer
//castingDeveloper.name
//castingDeveloper.age
//castingDeveloper.skill


// MARK: - any, anyobject

//var closure: (String) -> String = { name in
//    name
//}
//
//let array: [Any] = ["MacBook", 5, Developer(), closure]
//
//let index0: String = (array[0] as! String)
//let index1: Int = (array[1] as! Int)
//let index2: Developer = (array[2] as! Developer)
//let index3: (String) -> String = (array[3] as! (String) -> String)


//let objcArray: [AnyObject] = [Person(), Developer()]
//
//let objcIndex0: AnyObject = objcArray[0]
//let objcIndex1: AnyObject = objcArray[1]
//
//let objcIndex0: Person = (objcArray[0] as! Person)
//let objcIndex1: Developer = (objcArray[1] as! Developer)


//let optionalNum: Int? = 3
//print(optionalNum)          // 경고
//print(optionalNum as Any)   // 경고 없음


let array: [Any] = ["MacBook", 5, Developer(), {(name: String) in name}]

for (index, value) in array.enumerated() {
    switch value {
    case is String:
        print("Index \(index) - String 타입 입니다.")
    case let num as Int:
        print("Index \(index) - \(num), Int 타입입니다")
    case let danny as Developer:
        print("Index \(index) - 개발자 : \(danny.name), 나이 : \(danny.age), 스킬 : \(danny.skill)")
    case let closure as (String) -> String:
        print("Index \(index) - \(closure) 클로저 타입 입니다.")
    default: break
    }
}
