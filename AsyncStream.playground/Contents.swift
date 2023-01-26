import UIKit

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

let stream = AsyncStream<Int> { continuation in
    continuation.onTermination = { status in
        print("Stream terminated with status : \(status)")
    }
    for num in 1 ... 5 {
        continuation.yield(num)
    }
    print("finish pro")
    continuation.finish()
    print("finish pro1111")
}

Task {
    for await num in stream {
        print(num)
    }
}
