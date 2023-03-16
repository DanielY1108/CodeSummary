import UIKit

// MARK: - 의존성이란?

// 한 객체가 다른 객체에 의존하는 것을 의미합니다.

class Engine1 {
    func start() {
        print("엔진 가동")
    }
}

class Car1 {
    let engine = Engine1()

    func start() {
        engine.start()
        print("차가 출발합니다.")
    }
}

let myCar1 = Car1()
myCar1.start()

// 엔진
// 차가 출발합니다.

// 차의 객체는 엔진의 객체에 의존합니다.
// (이와 같이 Car 클래스 내부에서 Engine 객체를 생성하고 있습니다.)

// 이건 Car와 Engine 객체가 강하게 결합되있습니다.

// 만약 엔진 대신 전기 모터 차량으로 개조를 하려면 기존 코드를 수정해야 합니다.

class ElectricMotor1 {
    func start() {
        print("전기모터 가동")
    }
}

class Car2 {
    let motor = ElectricMotor1()

    func start() {
        motor.start()
        print("전기차가 출발합니다.")
    }
}

let myCar2 = Car2()
myCar2.start()

// MARK: - 의존성 주입

// MARK:  1. 생성자 주입 방법
class Engine3 {
    func start() {
        print("엔진 가동")
    }
}

class Car3 {
    private let engine: Engine3

    init(engine: Engine3) {
        self.engine = engine
    }

    func start() {
        engine.start()
        print("차가 출발합니다.")
    }
}

let engine3 = Engine3()
let myCar3 = Car3(engine: engine3)
myCar3.start()


// MARK: - 2. 프로퍼티 주입 방법

class Engine4 {
    func start() {
        print("엔진 가동")
    }
}

class Car4 {
    var engine: Engine4?

    func start() {
        engine?.start()
        print("차가 출발합니다.")
    }
}

let engine4 = Engine4()
let myCar4 = Car4()

// Car 인스턴스의 engine 프로퍼티에 Engine 인스턴스 할당
myCar4.engine = engine4
myCar4.start()

// MARK: - 3. 메서드 주입방법

class Engine5 {
    func start() {
        print("엔진 가동")
    }
}

class Car5 {
    // Engine 클래스를 파라미터로 전달받음
    func start(with engine: Engine5) {
        engine.start()
        print("차가 출발합니다.")
    }
}

let engine5 = Engine5()
let myCar5 = Car5()
// Engine 클래스의 인스턴스를 전달함
myCar5.start(with: engine5)

// MARK: - 인터페이스 주입

// 프로토콜 정의
protocol EngineProtocol1 {
    func start()
}

// 하위 모듈 - 프로토콜 채택
class Engine6: EngineProtocol1 {
    func start() {
        print("엔진 가동")
    }
}

// 상위 모듈 - 생성 시 프로토콜을 파라미터로 받음
class Car6 {
    private let engine: EngineProtocol1
    
    init(engine: EngineProtocol1) {
        self.engine = engine
    }
    
    func start() {
        // 프로토콜을 이용해 하위 모듈의 메서드 사용
        engine.start()
        print("차가 출발합니다.")
    }
}

let engine6 = Engine6()
let myCar6 = Car6(engine: engine6)
myCar6.start()


// MARK: - 의존성 → 의존성 주입으로 변경하면 어떠한 차이가 있나 확인 해봅시다.

// 프로토콜 정의
protocol EngineProtocol {
    func start()
}

// 하위 모듈 -
class GasolineEngine: EngineProtocol {
    func start() {
        print("가솔린 엔진 가동")
    }
}

// 전기차를 추가
class ElectricMotor: EngineProtocol {
    func start() {
        print("전기모터 가동")
    }
}

// 상위 모듈
class Car {
    private let engine: EngineProtocol
    
    init(engine: EngineProtocol) {
        self.engine = engine
    }
    
    func start() {
        // 프로토콜을 이용해 하위 모듈의 메서드 사용
        engine.start()
        print("차가 출발합니다.")
    }
}

let gasoline = GasolineEngine()
let motor = ElectricMotor()

let myElectricCar = Car(engine: motor)
let myGasolineCar = Car(engine: gasoline)

myGasolineCar.start()
myElectricCar.start()



