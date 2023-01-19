import UIKit


// MARK: - 일반적인 사용방법

let oneTwoThree = 1...3
for number in oneTwoThree {
    print(number)
}
// Prints "1"
// Prints "2"
// Prints "3"


// MARK: - 순차적으로 확인 가능

let bugs = ["개미", "호박벌", "매미", "잠자리", "집게벌래"]
var hasMosquito = false
for bug in bugs {
    if bug == "모기" {
        hasMosquito = true
        break
    }
}
print("벌레에 모기가 포함되어 있나요? : \(hasMosquito)")
// Prints 벌레에 모기가 포함되어 있나요? : false

// MARK: - 간결하게 시퀀스 생성

if bugs.contains("모기") {
    print("에프킬라로 벌레 퇴치하기!")
} else {
    print("모기는 없네요")
}
// Prints "모기는 없네요"

// MARK: - 커스텀 타입에서의 시퀀스 생성방법

struct Danny: Sequence {
    func makeIterator() -> DannyIterator {
        return DannyIterator(count: 5)
    }
}

struct DannyIterator: IteratorProtocol {
    typealias Element = Int
    var count: Int
    
    mutating func next() -> Int? {
        guard count != 0 else {
            return nil
        }
        defer { count -= 1}
        return count
    }
}

let danny = Danny()
for vlaue in danny {
    print(vlaue)
}
// 5
// 4
// 3
// 2
// 1

// MARK: - 사용자 타입에서 조금더 간결하게 사용하기

struct Dannys: Sequence, IteratorProtocol {
    var count: Int
    
    mutating func next() -> Int? {
        guard count != 0 else {
            return nil
        }
        defer { count -= 1}
        return count
    }
}

let dannys = Dannys(count: 5)
for count in dannys {
    print(count)
}
// 5
// 4
// 3
// 2
// 1


// MARK: - Collection 프로토콜 내부

protocol Collection<Element> : Sequence {
    // Index는 위치를 나타낸다.
    associatedtype Index : Comparable
    
    // 첫번째 Element의 위치
    var startIndex: Self.Index { get }
    
    // 마지막 Element의 위치
    var endIndex: Self.Index { get }
    
    // 지정된 위치의 Element 값
    subscript(position: Self.Index) -> Self.Element { get }
    
    // 주어진 Index의 바로 뒤의 위치
    func index(after i: Self.Index) -> Self.Index
}


//아래와 같은 형식으로 next()의 추론이 가능합니다.

// 1. startIndex로 첫 번째의 Index를 알 수 있습니다.
// 2. index(after:) 메서드로 다음 Index를 얻을 수 있고
// 3. subscript로 각각의 Element 값을 얻을 수 있고
// 4. 마지막엔 endIndex와 index(after:)로 얻은 Index가 같다면 iterate(반복)을 종료합니다.
