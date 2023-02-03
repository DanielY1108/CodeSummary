import UIKit

// MARK: - GCD

// main
DispatchQueue.main

// global
DispatchQueue.global(qos: )

// custom
let custom = DispatchQueue(label: "serial Queue")


// QOS(Quality Of Service)

DispatchQueue.global(qos: .userInteractive)  // 소요 시간: 거의 즉시
DispatchQueue.global(qos: .userInitiated)    // 소요 시간: 몇초
DispatchQueue.global()                       // 기본값
DispatchQueue.global(qos: .utility)          // 소요 시간: 몇초에서 몇분
DispatchQueue.global(qos: .background)       // 소요 시간: 몇분 이상(에너지 효율)
DispatchQueue.global(qos: .unspecified)      // 오래된 API 지원

let mainQueue =  OperationQueue.main  // 메인큐에서 작업
let queue = OperationQueue()          // 백그라운드큐에서 작업


// MARK: - 동기 코드 예시

print("1")

DispatchQueue.global().sync {
    sleep(2)
    print("동기 끝")
}

print("2")

// MARK: - 비동기 코드 예시

print("1")

DispatchQueue.global().sync {
    sleep(2)
    print("비동기 끝")
}

print("2")



// 그림을 다시 그리는 작업같이 화면관련 UI관련 코드들은 메인쓰레드에서 일을 해야 된다.

var imageView: UIImageView?

let url = URL(string: "https://bit.ly/32ps0DI")!

// URL세션은 내부적으로 비동기로 처리된 함수임!!!
URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    if error != nil{
        print("에러있음")
    }
    
    guard let imageData = data else { return }
    
    // 즉, 데이터를 가지고 이미지로 변형하는 코드
    let photoImage = UIImage(data: imageData)
    
    // UI 관련된 작업(이미지 표시 등)은 반드시 DispatchQueue.main에서 작업을 시켜야 된다!
    DispatchQueue.main.async {
        imageView?.image = photoImage
    }
    
}.resume()


// 비동기작업은 대부분 시간이 오래 걸린다.
// return형으로 함수는 다른 쓰레드로 보낸 작업이 끝나기 전에 return을 호출하여, return값에 데이터를 전달받을 수 없다. 무조건 nil 반환
//
// 콜백함수를 사용해야 한다 (completionHandler)
// @escaping키워드로 함수가 끝나도 데이터를 힙영역에 저장

func properlyGetImages(with urlString: String, completionHandler: @escaping (UIImage?) -> Void) {
    
    let url = URL(string: urlString)!
    
    var photoImage: UIImage? = nil
    // URL은 비동기적으로 작업
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print("에러있음: \(error!)")
        }
        // 옵셔널 바인딩
        guard let imageData = data else { return }
        
        // 데이터를 UIImage 타입으로 변형
        photoImage = UIImage(data: imageData)
        
        // 콜백함수
        completionHandler(photoImage)
        
    }.resume()
    
}

// 올바르게 설계한 함수 실행. 주소를 받아 클로저 실행
properlyGetImages(with: "https://bit.ly/32ps0DI") { image in
    
    // 처리 관련 코드 넣는 곳...
    
    DispatchQueue.main.async {
        // UI관련작업의 처리는 여기서
    }
    
}
