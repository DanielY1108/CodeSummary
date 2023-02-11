import UIKit


// MARK: - 기본 URL 사용
let urlStr1 = "https://ios-daniel-yang.tistory.com/search?keyword=iOS&page=1"
let url1 = URL(string: urlStr1)!

print(url1.absoluteURL)
print(url1.scheme)
print(url1.host)
print(url1.path)
print(url1.query)


// MARK: - URLComponents 사용법
var components = URLComponents()
components.scheme = "https"
components.host = "ios-daniel-yang.tistory.com"
components.path = "/search"
components.queryItems = [
    URLQueryItem(name: "keyword", value: "iOS"),
    URLQueryItem(name: "page", value: "1")
]
components.url


var components = URLComponents(string: "https://ios-daniel-yang.tistory.com/search")!
let keyword = URLQueryItem(name: "keyword", value: "iOS")
let page = URLQueryItem(name: "page", value: "1")
components.queryItems = [keyword, page]

components.url
