
import XCTest
@testable import UnitTestCalc_Demo

final class UnitTestCalc_DemoTests: XCTestCase {
    
    private var calculator: Calculator!

    
    // 테스트 메서드가 실행되기 전에 setup이 먼저 실행 됩니다.
    override func setUp() {
        super.setUp()
        
        // 초기화를 해줍니다.
        self.calculator = Calculator()
    }
    
    func test_SubtractTwoNumbers() {
    
        let result = self.calculator.subtract(5, 2)
        
        XCTAssertEqual(result, 3, "빼기 비교 결과값이 다름")
    }
 
    func test_AddTwoNumbers() {
        
        // 두 숫자의 계산값을 리턴 받는다.
        let result = self.calculator.add(2, 3)
        
        // 값이 같은지 여부를 확인 합니다.(계산결과, 내가 생각하는 맞는 결과값, 실패시 메세지)
        XCTAssertEqual(result, 5, "더하기 비교 결과값이 다름")
    }
    
    // 유닛 테스트가 끝난 후 테스트 내용을 모두 삭제합니다. (clean-up)
    // 만약 어떤 값을 변경했을 경우 다음 테스트에서 문제가 발생할 수 있기 떄문이다.
    override class func tearDown() {
        super.tearDown()
    }
    
}


//유닛 테스트에서 아래와 같은 개념들이 중요합니다.
//
//1. 속도 (Speed)
//
//유닛 테스트는 개발자가 코드 변경사항을 검증하는 데 사용되므로 빠른 실행 속도가 필요합니다. 느린 테스트는 개발자가 코드를 수정하고 결과를 확인하기까지 시간이 많이 걸리므로 생산성을 저하시킵니다. 따라서 유닛 테스트에서는 빠른 속도로 테스트를 수행할 수 있도록 설계해야 합니다.
//
//1. 자동화 (Automation)
//
//자동화란, 테스트를 실행하고 결과를 확인하는 모든 과정을 자동으로 처리하는 것을 의미합니다. 수동으로 테스트를 수행하는 것보다 자동화된 테스트를 수행하면 시간과 비용을 절약할 수 있습니다. 또한 자동화된 테스트는 개발자가 코드를 변경하거나 기능을 추가할 때마다 쉽게 실행할 수 있어서 버그를 신속하게 찾을 수 있습니다.
//
//1. 독립적 (independent)
//
//유닛 테스트는 각각의 테스트가 서로 독립적으로 실행될 수 있어야 합니다. 이것은 특정 테스트의 결과가 다른 테스트에 영향을 미치지 않아야 한다는 것을 의미합니다. 즉, 의존성을 최소화하고 각각의 테스트 케이스가 독립적으로 실행될 수 있도록 작성하는 것이 중요합니다.  이러한 방식으로 작성된 유닛 테스트는 코드 변경에 대해 신속하게 반응할 수 있으며, 테스트 결과에 대한 신뢰도를 높일 수 있습니다.
//
//1. 반복적 (Repeatable)
//
//유닛 테스트는 반복적으로 실행될 수 있어야 합니다. 동일한 입력값에 대해서는 항상 동일한 결과를 보여야 하며, 실행 순서나 실행환경이 달라져도 동일한 결과를 보여주어야 합니다. 이러한 특징은 테스트의 신뢰성을 높일 수 있으며, 변경사항에 대한 검증을 보장합니다.


//XCTest 프레임워크에서 제공하는 XCTAssert 메서드는 유닛 테스트에서 결과 값을 검증하기 위한 방법을 제공합니다. 아래는 주요한 몇 가지 Assert 메서드입니다.
//
//1. XCTAssertEqual(expected: T, expression: T, message: String)
//- 두 값이 같은지 확인합니다.
//- expected: 예상 값
//- expression: 테스트 대상 실제 값
//- message: 실패 시 출력할 메시지
//1. XCTAssertNotEqual(first: T, second: T, message: String)
//- 두 값이 다른지 확인합니다.
//- first: 첫 번째 값
//- second: 두 번째 값
//- message: 실패 시 출력할 메시지
//1. XCTAssertTrue(expression: Bool, message: String)
//- 조건이 참인지 확인합니다.
//- expression: 테스트 대상 조건
//- message: 실패 시 출력할 메시지
//1. XCTAssertFalse(expression: Bool, message: String)
//- 조건이 거짓인지 확인합니다.
//- expression: 테스트 대상 조건
//- message: 실패 시 출력할 메시지
//1. XCTAssertNil(expression: Any?, message: String)
//- 값이 nil인지 확인합니다.
//- expression: 테스트 대상 값
//- message: 실패 시 출력할 메시지
//1. XCTAssertNotNil(expression: Any?, message: String)
//- 값이 nil이 아닌지 확인합니다.
//- expression: 테스트 대상 값
//- message: 실패 시 출력할 메시지
//1. XCTAssertEqualWithAccuracy(first: Double, second: Double, accuracy: Double, message: String)
//- 두 실수 값이 지정한 정확도 범위 내에 있는지 확인합니다.
//- first: 첫 번째 실수 값
//- second: 두 번째 실수 값
//- accuracy: 허용 오차 범위
//- message: 실패 시 출력할 메시지
//
//등이 있습니다. 이외에도 다양한 Assert 메서드가 제공되며, 이를 이용해 테스트 케이스를 작성하고 실행할 수 있습니다.
