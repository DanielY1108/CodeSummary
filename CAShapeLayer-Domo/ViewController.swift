//
//  ViewController.swift
//  CAShapeLayer-Domo
//
//  Created by JINSEOK on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = CustomRoundRectView(frame: CGRect(x: 0,
                                                  y: 100,
                                                  width: self.view.frame.width,
                                                  height: 650))
        customView.backgroundColor = .lightGray
        self.view.addSubview(customView)
    }
}


class CustomRoundRectView: UIView {
    
    override func draw(_ rect: CGRect) {
//        let path = UIBezierPath(roundedRect: CGRect(x: 50, y: 200, width: 300, height: 100),
//                                cornerRadius: CGFloat(50))
        let path = UIBezierPath(roundedRect: CGRect(x: 50, y: 200, width: 300, height: 100),
                                byRoundingCorners: [.topLeft, .bottomRight],
                                cornerRadii: CGSize(width: 50, height: 0))
        
        path.lineWidth = 5
        UIColor.red.setStroke()
        path.stroke()
    }
}


// MARK: - addClip 교차 영역에 있는 것만 렌더링
class CustomAddClipView: UIView {
    
    override func draw(_ rect: CGRect) {
        let squarePath = UIBezierPath(rect: CGRect(x: 100, y: 200, width: 200, height: 200))
        
        // addClip 사용
        squarePath.addClip()
        
        let circlePath = UIBezierPath(ovalIn: CGRect(x: 100, y: 300, width: 200, height: 200))
        circlePath.addClip()

        // UIBezierPath의 drawing 속성 설정
        squarePath.lineWidth = 5
        circlePath.lineWidth = 5
        
        UIColor.red.setStroke()
        squarePath.stroke()
        
        UIColor.blue.setStroke()
        circlePath.stroke()
    }
}



// MARK: - 연습 선으로 도형그리기
class CustomLineView: UIView {
    
    override func draw(_ rect: CGRect) {
        // UIBezierPath 객체 생성
        let path = UIBezierPath()
        
        // 경로 시작점 설정 (현재 원점)
        path.move(to: CGPoint(x: 0, y: 0))
        
        // 처음 그려준 선
        path.addLine(to: CGPoint(x: 100, y: 400))  // 1
        // 위의 마지막 지점이 다음 선의 시작점으로 된다. (100, 400)
        path.addLine(to: CGPoint(x: 300, y: 400))  // 2
        
        // 경로를 닫는다. (도형을 만들어준다)
        path.close()
        
        // UIBezierPath의 drawing 속성 설정
        path.lineWidth = 5       // 테두리 선의 굵기
        
        UIColor.red.setStroke()  // 테투리 색상 설정
        path.stroke()            // 경로의 테투리 생성

        UIColor.blue.setFill()   // 채울 색상 설정
        path.fill()              // 이어진 공간의 색을 채워준다.
    }
}


#if DEBUG
import SwiftUI
struct Preview: UIViewControllerRepresentable {
    
    // 여기 ViewController를 변경해주세요
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
    
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
}

struct ViewController_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            Preview()
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("Preview")
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
        }
    }
}
#endif



