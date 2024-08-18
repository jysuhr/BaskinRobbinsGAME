//
//  ViewController.swift
//  SimpleGame_package
//
//  Created by 서준영 on 8/18/24.
//

import UIKit

class ViewController: UIViewController {

    let titleRactangle = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor1
        
        titleRacSetup()
        titleLabelSetup()
    }
    
    func titleRacSetup() {
        // 제목 사각형 생성
        titleRactangle.backgroundColor = bgColor2
        titleRactangle.layer.cornerRadius = 20
        titleRactangle.layer.masksToBounds = true // 잘라낸 코너 부분을 보이지 않게 처리
        titleRactangle.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleRactangle)
        
        NSLayoutConstraint.activate([
            titleRactangle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            titleRactangle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleRactangle.widthAnchor.constraint(equalToConstant: 200),
            titleRactangle.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func titleLabelSetup() {
        let titleLabel = UILabel()
        titleLabel.text = "게임 선택"
        titleLabel.font = UIFont.systemFont(ofSize: 26)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // titleRactangle에 titleLabel 추가
        titleRactangle.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: titleRactangle.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleRactangle.centerYAnchor)
        ])
    }
}


/** 색상 인스턴스 선언 */
extension ViewController {
    var bgColor1: UIColor{
        return UIColor(hex: "#B7C5EA")
    }
    var bgColor2: UIColor{
        return UIColor(hex: "FFFFFF")
    }
}


#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
