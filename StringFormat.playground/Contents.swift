import UIKit

// %d , %f, %ld, %@
// INT_VALUE, FLOAT_VALUE, DOUBLE_VALUE, STRING_VALUE

// MARK: - 실수형
let rNum1: Float = 12.123
let rNum2: Float = 45.456
// 변화를 확인하기 위해 []로 구분을 지어줌, 사용 시 [] 제거!
String(format:"[%f]", rNum1)                     // [12.123000]
// 소수점 첫 째 자리까지 출력
String(format:"[%.1f]", rNum1)                   // [12.1]
// 소수점 둘 째 짜리까지 출력
String(format:"[%.2f]", rNum1)                   // [12.12]
// 문자의 길이는 10개, 소수점 둘 째 짜리 출력 (오른쪽 정렬)
String(format:"[%10.2f]", rNum1)                 // [     12.12]
// 문자의 길이는 10개, 소수점 둘 째 짜리 출력 (왼쪽 정렬)
String(format:"[%-10.2f]", rNum1)                // [12.12     ]
// 문자의 길이는 10개, 공백을 0으로 채움, 소수점 둘 째 자리까지 출력
String(format:"[%010.2f]", rNum1)                // [0000012.12]
// 이와같이 여러 인수 사용가능
String(format:"[%.1f, %.1f]", rNum1, rNum2)      // [12.1, 45.5]
// 만약 첫 번재 인수와 두 번째 인수와 위치를 바꿔주려면
// 1$(첫 번째 인수), 2$(두 번째 인수)를 사용하여 위치를 변경이 가능.
String(format:"[%2$.1f, %1$.1f]", rNum1, rNum2)  // [45.5, 12.1]


// MARK: - 정수형
let num1 = 123
let num2 = 456
// 변화를 확인하기 위해 []로 구분을 지어줌
String(format: "[%d]", num1)                // [123]
// 숫자가 범위를 넘어가면 앞에 공백 (왼쪽 정렬)
String(format: "[%5d]", num1)               // [  123]
// 숫자가 범위를 넘어가면 뒤에 공백 (오른쪽 정렬)
String(format: "[%-5d]", num1)              // [123  ]
// 숫자가 범위를 넘어가면 앞에 0 추가
String(format: "[%.5d]", num1)              // [00123]
// 이와같이 여러 인수 사용가능
String(format: "[%d, %d]", num1, num2)      // [123, 456]
// 만약 첫 번재 인수와 두 번째 인수와 위치를 바꿔주려면
// 1$(첫 번째 인수), 2$(두 번째 인수)를 사용하여 위치를 변경이 가능.
String(format: "[%2$d, %1$d]", num1, num2)  // [456, 123]

let hours = 7
let minutes = 30
let seconds = 5
String(format: "%d : %d : %d", hours, minutes, seconds)
String(format: "%02d : %02d : %02d", hours, minutes, seconds)      // [123, 456]



// MARK: - 문자열
let firstName = "Daniel"
let lastName = "Yang"
// 동작은 정수랑 똑같이 각 인수를 받아서 사용 가능
let korFormat = "내 이름은 %2$@ %1$@"
let engFormat = "My name is %@ %@"

String(format: korFormat, firstName, lastName)
String(format: engFormat, firstName, lastName)
// 내 이름은 Yang Daniel
// My name is Daniel Yang
