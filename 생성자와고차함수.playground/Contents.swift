import UIKit

struct CoffeeOrderList {
    let orderList: [CoffeeOrder]
}

struct CoffeeOrder {
    let name: String
    let order: Menu
}

struct Menu {
    let coffee: String
    let size: String
}


// 고차함수 이용
// 타입이 (String, Menu) -> CoffeeOrder 이므로 바로 map의 파라미터에 대입이 가능

let daniel: (String ,Menu) = ("Daniel", Menu(coffee: "cappuccino", size: "small"))
let basco: (String ,Menu) = ("Basco", Menu(coffee: "espresso", size: "medium"))
let nina: (String ,Menu) = ("Nina", Menu(coffee: "latte", size: "large"))

let customers: [(String, Menu)] = [daniel, basco, nina]

let orders: [CoffeeOrder] = customers.map(CoffeeOrder.init)

let ordersList = CoffeeOrderList(orderList: orders)



// 생성"()" 을 안해줄 시 init의 타입은?

let daniel1: Menu = Menu(coffee: "cappuccino", size: "small")
let basco1: Menu = Menu(coffee: "espresso", size: "medium")
let nina1: Menu = Menu(coffee: "latte", size: "large")

let order: (String, Menu) -> CoffeeOrder = CoffeeOrder.init

let order1: CoffeeOrder = order("Daniel", daniel1)
let order2 = CoffeeOrder(name: "Basco", order: basco1)
let order3 = CoffeeOrder.init(name: "Nina", order: nina1)

let orders1: [CoffeeOrder] = [order1, order2, order3]

let ordersList1 = CoffeeOrderList(orderList: orders1)

