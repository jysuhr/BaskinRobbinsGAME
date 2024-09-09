//
//  ViewController.swift
//  SimpleGame_package
//
//  Created by 서준영 on 8/18/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: 컴포넌트 인스턴스 선언
    let titleRactangle = UIView()
    let titleLabel = UILabel()
    let baskinRobbinsButton = UIButton()
    let multipleButton = UIButton()
    let updownButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor1
        
        titleRacSetup()
        titleLabelSetup()
        baskinRobbinsButtonSetup()
        multipleButtonSetup()
        updownButtonSetup()
    }
    
    // MARK: - 컴포넌트 Setup
    func titleRacSetup() {
        // 제목 사각형 생성
        titleRactangle.backgroundColor = laColor1
        titleRactangle.layer.cornerRadius = 25
        titleRactangle.layer.masksToBounds = true // 잘라낸 코너 부분을 보이지 않게 처리
        self.view.addSubview(titleRactangle)
        
        titleRactangle.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(120)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
    }
    
    func titleLabelSetup() {
        // 타이틀 레이블 '게임 선택'
        titleLabel.text = "게임 선택"
        titleLabel.font = UIFont.systemFont(ofSize: 26)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.center.equalTo(titleRactangle)
        }
    }
    
    func baskinRobbinsButtonSetup() {
        // 베스킨라빈스 게임 진입 버튼
        baskinRobbinsButton.backgroundColor = btColor1
        baskinRobbinsButton.setTitle("베스킨라빈스31 게임", for: .normal)
        baskinRobbinsButton.setTitleColor(self.laColor1, for: .normal)
        baskinRobbinsButton.layer.cornerRadius = 16
        self.view.addSubview(baskinRobbinsButton)
        
        // 버튼이 눌렸을 때의 색상 변경
        baskinRobbinsButton.addTarget(self, action: #selector(buttonHighlighted(_:)), for: [.touchDown, .touchDragEnter])
        baskinRobbinsButton.addTarget(self, action: #selector(buttonNormal(_:)), for: [.touchUpInside, .touchDragExit, .touchCancel])
        
        // Button Action
        baskinRobbinsButton.addTarget(self, action: #selector(gotoBaskinVC), for: .touchUpInside)
        
        baskinRobbinsButton.snp.makeConstraints {
            $0.centerX.equalTo(titleRactangle.snp.centerX)
            $0.top.equalTo(titleRactangle.snp.bottom).offset(100)
            $0.width.equalTo(170)
            $0.height.equalTo(50)
        }
    }
    
    func multipleButtonSetup() {
        // 곱셈 게임 진입 버튼
        multipleButton.backgroundColor = btColor1
        multipleButton.setTitle("구구단 게임", for: .normal)
        multipleButton.setTitleColor(self.laColor1, for: .normal)
        multipleButton.layer.cornerRadius = 16
        self.view.addSubview(multipleButton)
        
        // 버튼이 눌렸을 때의 색상 변경
        multipleButton.addTarget(self, action: #selector(buttonHighlighted(_:)), for: [.touchDown, .touchDragEnter])
        multipleButton.addTarget(self, action: #selector(buttonNormal(_:)), for: [.touchUpInside, .touchDragExit, .touchCancel])
        
        // Button Action
        multipleButton.addTarget(self, action: #selector(gotoMultipleVC), for: .touchUpInside)
        
        multipleButton.snp.makeConstraints {
            $0.centerX.equalTo(titleRactangle.snp.centerX)
            $0.top.equalTo(baskinRobbinsButton.snp.bottom).offset(25)
            $0.width.equalTo(170)
            $0.height.equalTo(50)
        }
    }
    
    func updownButtonSetup() {
        // 업다운 게임 진입 버튼
        updownButton.backgroundColor = btColor1
        updownButton.setTitle("업다운 게임", for: .normal)
        updownButton.setTitleColor(self.laColor1, for: .normal)
        updownButton.layer.cornerRadius = 16
        self.view.addSubview(updownButton)
        
        // 버튼이 눌렸을 때의 색상 변경
        updownButton.addTarget(self, action: #selector(buttonHighlighted(_:)), for: [.touchDown, .touchDragEnter])
        updownButton.addTarget(self, action: #selector(buttonNormal(_:)), for: [.touchUpInside, .touchDragExit, .touchCancel])
        
        // Button Action
        updownButton.addTarget(self, action: #selector(gotoUpdownVC), for: .touchUpInside)
        
        updownButton.snp.makeConstraints {
            $0.centerX.equalTo(titleRactangle.snp.centerX)
            $0.top.equalTo(multipleButton.snp.bottom).offset(25)
            $0.width.equalTo(170)
            $0.height.equalTo(50)
        }
    }
    
    @objc func buttonHighlighted(_ sender: UIButton) {
        sender.backgroundColor = btColor1.withAlphaComponent(0.7) // 버튼이 눌렸을 때의 색상
    }

    @objc func buttonNormal(_ sender: UIButton) {
        sender.backgroundColor = btColor1 // 버튼이 정상 상태일 때의 색상
    }
        
    @objc func gotoBaskinVC() {
        print("베스킨라빈스 버튼이 눌림!!")
        let baskinVC = BaskinViewController()
        self.navigationController?.pushViewController(baskinVC, animated: true)
    }
    
    @objc func gotoMultipleVC() {
        print("구구단 게임 버튼이 눌림!!")
        let multipleVC = MultipleViewController()
        self.navigationController?.pushViewController(multipleVC, animated: true)
    }
    
    @objc func gotoUpdownVC() {
        print("업다운 게임 버튼이 눌림!!")
        let updownVC = UpDownViewController()
        self.navigationController?.pushViewController(updownVC, animated: true)
    }
}







/**
 Layout 미리보기 - SwiftUI를 사용
 미리보기 창 열기: Opt + Cmd + Enter
 */
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
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
        }
        
    }
} #endif
