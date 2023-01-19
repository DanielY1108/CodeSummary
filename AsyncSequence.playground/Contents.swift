import UIKit


//@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
//@rethrows public protocol AsyncSequence {
//
//    // AsyncIterator는 반복을 위해 AsyncIteratorProtocol을 구현해줘야 하네요.
//    associatedtype AsyncIterator : AsyncIteratorProtocol
//
//    // 사용할 요소의 타입을 정해 주네요.
//    associatedtype Element where Self.Element == Self.AsyncIterator.Element
//
//    // 반복동작을 위해 위에 만든 AsyncIterator를 리턴합니다.
//    func makeAsyncIterator() -> Self.AsyncIterator
//}


// MARK: - AsyncSequence 기본 사용법
struct Danny1: AsyncSequence, AsyncIteratorProtocol {
    typealias Element = Int
    var count: Int
    
    mutating func next() async -> Int? {
        if count < 0 { return nil }
        defer { count -= 1 }
        return count
    }
    
    func makeAsyncIterator() -> Danny1 {
        return self
    }
}

let danny1 = Danny1(count: 5)

Task {
    for await value in danny1 {
        print(value)
    }
}

// 5
// 4
// 3
// 2
// 1


// MARK: - AsyncSequence 에러 처리 함께 하기

enum NumberError: Error {
    case lessThanZero
    
    var printMessage: Void {
        switch self {
        case .lessThanZero:
            print("Error: 음수를 감지함!")
        }
    }
}

struct Danny: AsyncSequence, AsyncIteratorProtocol {
    typealias Element = Int
    var count: Int
    
    mutating func next() async throws -> Int? {
        if count < 0 { throw NumberError.lessThanZero }
        defer { count -= 1 }
        return count
    }
    
    func makeAsyncIterator() -> Danny {
        return self
    }
}

let danny = Danny(count: 5)

Task {
    do {
        for try await value in danny {
            print(value)
        }
    }
    catch {
        NumberError.lessThanZero.printMessage
    }
}
