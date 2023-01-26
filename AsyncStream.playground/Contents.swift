import UIKit
import Foundation

//let stream = AsyncStream<Int> { continuation in
//    Task {
//        for num in 1 ... 5 {
//            try await Task.sleep(nanoseconds: 5 * 1_000_000_00)
//            continuation.yield(num)
//        }
//        continuation.finish()
//    }
//}
//
//Task {
//    for await num in stream {
//        print(num)
//    }
//}


//let stream = AsyncStream<Int>(Int.self,
//                              bufferingPolicy: .bufferingNewest(2)) { continuation in
//    for num in 1 ... 5 {
//            continuation.yield(num)
//        }
//        continuation.finish()
//}
//
//Task {
//    for await num in stream {
//        print(num)
//    }
//}


//let stream = AsyncStream<Int> { continuation in
//    continuation.onTermination = { status in
//        print("Stream terminated with status : \(status)")
//    }
//    for num in 1 ... 5 {
//        continuation.yield(num)
//    }
//    print("finish pro")
//    continuation.finish()
//    print("finish pro1111")
//}
//
//Task {
//    for await num in stream {
//        print(num)
//    }
//}



//enum NumError: Error {
//    case overThree
//}
////
//let stream = AsyncThrowingStream<Int, Error> { continuation in
//    continuation.onTermination = { status in
//        switch status {
//        case .finished:
//            print("Stream terminated with status : \(status)")
//        case .cancelled:
//            print("Stream terminated with status : \(status)")
//        }
//    }
//    Task {
//        for num in 1 ... 5 {
//            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
//            if num > 2 {
//                continuation.finish(throwing: NumError.overThree)
//            } else {
//                continuation.yield(num)
//            }
//        }
//        continuation.finish()
//    }
//}
//
//let task = Task {
//    do {
//        for try await num in stream {
//            print(num)
//        }
//    } catch {
//        print(error)
//    }
//}
//sleep(3)
//task.cancel()


var task: Task<(), Never>?

let stream = AsyncStream<Int> { continuation in

    continuation.onTermination = { status in
        switch status {
        case .finished:
            print("Stream terminated with status : \(status)")
        case .cancelled:
            print("Stream terminated with status : \(status)")
            continuation.finish()
        }
    }

    task = Task.detached {
        for num in 1...10 {
            try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            continuation.yield(num)

            if num > 2 {
                continuation.onTermination?(.cancelled)
            }
        }
        continuation.finish()
    }

}


Task {
    for await num in stream {
        print(num)
    }
}



//func stream() -> AsyncStream<Int> {
//    return AsyncStream<Int> { continuation in
//        continuation.onTermination = { status in
//            switch status {
//            case .finished:
//                print("Stream terminated with status : \(status)")
//            case .cancelled:
//                print("Stream terminated with status : \(status)")
//                continuation.finish()
//            }
//        }
//
//        let task = Task.detached {
//            for num in 1...5 {
//                try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
//                continuation.yield(num)
//            }
//            print("Progress finish before")
//            continuation.finish()
//            print("Progress finish after")
//        }
//    }
//}
//
//let task = Task {
//    for await num in stream() {
//        print(num)
//    }
//}
//sleep(3)
//task.cancel()



//class Time11 {
//    var task: Task <(), Never >?
//
//    func stream() -> AsyncStream<Int> {
//        return AsyncStream<Int> { continuation in
//            continuation.onTermination = { @Sendable status in
//                sleep(3)
//                self.task?.cancel()
//            }
//
//            task = Task.detached {
//                for num in 1...5 {
//                    try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
//                    continuation.yield(num)
//                }
//                print("Progress finish before")
//                continuation.finish()
//                print("Progress finish after")
//            }
//        }
//    }
//}
//
//let a = Time11().stream()
//
//Task {
//    for await num in a {
//        print(num)
//    }
//}


//let stream = AsyncStream<Int> {
//    await Task.sleep(1 * 1_000_000_)
//    return Int.random(in: 1...10)
//} onCancel: { @Sendable () in print("Canceled.") }
//
//// Call point:
//for await random in stream {
//    print(random)
//}
