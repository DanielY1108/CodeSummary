import UIKit

class Observable<T> {
    
    var value: T? {
        didSet {
            self.listener?(self.value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    // 동작을 담아두는 클로저입니다. (실행 X)
    private var listener: ((T?) -> Void)?
    
    // 이 함수가 호출이 되면 아래와 같은 작업을 실행
    func bind(_ listener: @escaping (T?) -> Void) {
        // completion에서 value의 값을 갖고 동작을 실행시킨다 (여기서는 아래 저장해둔 self.value = num 동작을 실행)
        listener(value)
        // 다음으로 변수로 만들어 놓은 listener에 위의 동작을 저장시킨다.
        self.listener = listener
    }
}

class ViewModel {
    var item: Observable<Int> = Observable(0)
}

class Cart {
    var viewModel = ViewModel()
    var itemcCount = 0
    
    func setBinding() {
        viewModel.item.bind { [weak self] num in
            guard let num = num else { return }
            self?.itemcCount = num
        }
    }
    
    func addCount(n: Int) {
        viewModel.item.value = n
    }
}


let cart = Cart()

// 이 바인딩을 실행시켜주면 동작 실행 및 동작을 저장
cart.setBinding()
print(cart.itemcCount)
// 값이 바뀌면 didSet이 동작하여 저장해논 동작을 실행
cart.addCount(n: 10)
print(cart.itemcCount)
cart.addCount(n: 20)
print(cart.itemcCount)
cart.addCount(n: 30)
print(cart.itemcCount)

