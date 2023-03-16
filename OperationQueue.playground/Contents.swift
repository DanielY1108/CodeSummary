import UIKit

// MARK: - DispatchQueue

let myQueue = DispatchQueue(label: "MyQueue", qos: .userInteractive, attributes: .concurrent)
let imageQueue = DispatchQueue(label: "Image Queue", qos: .background, attributes: .concurrent)

func nameWork() {
    for name in ["A", "B", "C", "D"] {
        print(name)
    }
}

func imageWork() {
    for _ in 0...5 {
        print("Image Download")
    }
}

// 아이템으로 담아서 관리 가능
let dispatchItem1 = DispatchWorkItem {
    nameWork()
}

let dispatchItem2 = DispatchWorkItem {
    imageWork()
}

for _ in 0...100 {
    myQueue.async(execute: dispatchItem1)
    imageQueue.async(execute: dispatchItem2)
}


// MARK: - OperationQueue
// 조금더 손이 더 많이 가지만 OperationQueue에서는 직접적으로 세세하게 조절할 수 있다.

class NameOperation: Operation {
    // 상속 받은 main 메서드 비어있어서 super.init을 안해줘도 됩니다.
    override func main() {
        // 취소되면 동작을 그냥 넘긴다.
        guard self.isCancelled == false else {
            return
        }
        nameWork()
    }
}

class ImageOperation: Operation {
    override func main() {
        imageWork()
    }
}

let nameOperationQueue = OperationQueue()
// 동시에 실행할 수 있는 작업의 갯수를 설정 (동시에 작업할 수 있는 쓰레드가 한개)
// maxConcurrentOperationCount로 1로 주면 GCD에서 직렬로 작업하는 것과 비슷한 역활을 한다.
nameOperationQueue.maxConcurrentOperationCount = 1
// QOS 설정 가능
nameOperationQueue.qualityOfService = .background

let imageOperationQueue =  OperationQueue()

for _ in 0...100 {
    nameOperationQueue.addOperation(NameOperation())
    imageOperationQueue.addOperation(ImageOperation())
}

Thread.sleep(forTimeInterval: 0.001)
// 취소 시키는 작업
nameOperationQueue.cancelAllOperations()
