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
    
    // 동작을 담는 클로저 (실행 X)
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        // 첫번째로 클로저의 값으로 실행을 시키준다(여기서는 self.value = num 이 동작을 실행)
        listener(value)
        // 그리고 위의 동작을 저장시켜 둔다. 그리고 value의 값이 변할 때마다 저장된 동작이 호출 됩니다.
        self.listener = listener
    }
}


class Cart {
    
    var viewModel = ViewModel()
    var value = 0
    
    func setBinding() {
        
        viewModel.itemcCount.bind { num in
            guard let num = num else { return }
            self.value = num
        }
    }

}

class ViewModel {
    
    var itemcCount: Observable<Int>
    
    init() {
        self.itemcCount = Observable(0)
    }
    
}


let cart = Cart()
cart.setBinding()

cart.viewModel.itemcCount.value = 10
print(cart.value)
cart.viewModel.itemcCount.value = 20
print(cart.value)
cart.viewModel.itemcCount.value = 30
print(cart.value)

