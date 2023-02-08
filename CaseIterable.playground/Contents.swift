import UIKit

enum SmartPhone: String ,CaseIterable {
    case apple
    case samsung
    case motorola
    case xiaomi
}

let phones = SmartPhone.allCases.map { $0.rawValue }
print(phones)
