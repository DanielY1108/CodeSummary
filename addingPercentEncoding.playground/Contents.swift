import UIKit

extension CharacterSet {
    func allCharacters() -> [Character] {
        var result: [Character] = []
        for plane: UInt8 in 0...16 where self.hasMember(inPlane: plane) {
            for unicode in UInt32(plane) << 16 ..< UInt32(plane + 1) << 16 {
                if let uniChar = UnicodeScalar(unicode), self.contains(uniChar) {
                    result.append(Character(uniChar))
                }
            }
        }
        return result
    }
}


let set: [CharacterSet] = [
    .urlUserAllowed,
    .urlPasswordAllowed,
    .urlHostAllowed,
    .urlPathAllowed,
    .urlQueryAllowed,
    .urlFragmentAllowed,
]


set.forEach{
    $0.allCharacters()
        .filter { !$0.isLetter && !$0.isNumber }
        .forEach { print($0, terminator: " ") }
    print("")
}

// ! $ & ' ( ) * + , - . ; = _ ~
// ! $ & ' ( ) * + , - . ; = _ ~
// ! $ & ' ( ) * + , - . : ; = [ ] _ ~
// ! $ & ' ( ) * + , - . / : = @ _ ~
// ! $ & ' ( ) * + , - . / : ; = ? @ _ ~
// ! $ & ' ( ) * + , - . / : ; = ? @ _ ~

// 해당 문자열은 인코딩을 하지 않습니다.


// MARK: - addingPercentEncoding 메서드 익스텐션 사용하기
extension String {
    var stringByAddingPercentEncoding: String {
        // 허용할 문자열
        let unreserved = ".=/:?"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        return self.addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet) ?? self
    }
    
    var stringByAddingPercentEncoding1: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
}


let city = "Los Angeles"
city.stringByAddingPercentEncoding
city.addingPercentEncoding(withAllowedCharacters: .urlUserAllowed)



let urlStr = "https://tistory.com/search?keyword=Los Angeles"
let stringByAddingPercentEncodingForURL = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
let url = URL(string: stringByAddingPercentEncodingForURL)

let url1 = URL(string: urlStr.stringByAddingPercentEncoding)
