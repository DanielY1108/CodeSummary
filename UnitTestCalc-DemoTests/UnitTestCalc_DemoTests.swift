
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

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
