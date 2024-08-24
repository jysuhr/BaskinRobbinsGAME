//
//  BaskinViewController.swift
//  SimpleGame_package
//
//  Created by 서준영 on 8/24/24.
//

import UIKit
import SnapKit

class BaskinViewController: UIViewController {
    
    let circlePanel = UIView()
    let gameNumLabel = UILabel()
    let play1Button1 = UIButton()
    let play1Button2 = UIButton()
    let play1Button3 = UIButton()
    let play2Button1 = UIButton()
    let play2Button2 = UIButton()
    let play2Button3 = UIButton()
    
    var gameNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor2
        
        circlePanelSetup()
        gameNumLabelSetup()
        playButtonSetup()
        
    }
    
    func circlePanelSetup() {
        circlePanel.backgroundColor = laColor1 // 1, 2, 3, 4, 5
        circlePanel.layer.cornerRadius = 250 / 2
        circlePanel.clipsToBounds = true
        self.view.addSubview(circlePanel)

        circlePanel.snp.makeConstraints {
            $0.width.height.equalTo(250)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(90)
        }
    }
    
    func gameNumLabelSetup() {
        gameNumLabel.text = "\(gameNumber)"
        gameNumLabel.textColor = numColor1
        gameNumLabel.font = UIFont.systemFont(ofSize: 100)
        gameNumLabel.textAlignment = .center
        self.view.addSubview(gameNumLabel)
        
        gameNumLabel.snp.makeConstraints {
            $0.width.height.equalTo(130)
            $0.center.equalTo(circlePanel)
        }
    }
    
    func playButtonSetup() {
        let buttons = [play1Button1, play1Button2, play1Button3, play2Button1, play2Button2, play2Button3]
        buttons.forEach {
            $0.backgroundColor = playColor
            $0.layer.cornerRadius = 16
            $0.setTitleColor(self.laColor1, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 50)
            $0.addTarget(self, action: #selector(buttonTapped(_: )), for: .touchUpInside)
            $0.addTarget(self, action: #selector(buttonHighlighted(_:)), for: [.touchDown, .touchDragEnter])
            $0.addTarget(self, action: #selector(buttonNormal(_:)), for: [.touchUpInside, .touchDragExit, .touchCancel])
            self.view.addSubview($0)
        }
        
        play1Button1.setTitle("1", for: .normal)
        play1Button2.setTitle("2", for: .normal)
        play1Button3.setTitle("3", for: .normal)
        play2Button1.setTitle("1", for: .normal)
        play2Button2.setTitle("2", for: .normal)
        play2Button3.setTitle("3", for: .normal)

        
        play1Button1.snp.makeConstraints {
            $0.top.equalTo(circlePanel.snp.bottom).offset(120)
            $0.leading.equalTo(self.view.snp.leading).offset(50)
            $0.width.height.equalTo(90)
        }
        play1Button2.snp.makeConstraints {
            $0.top.equalTo(play1Button1.snp.bottom).offset(20)
            $0.leading.equalTo(self.view.snp.leading).offset(50)
            $0.width.height.equalTo(90)
        }
        play1Button3.snp.makeConstraints {
            $0.top.equalTo(play1Button2.snp.bottom).offset(20)
            $0.leading.equalTo(self.view.snp.leading).offset(50)
            $0.width.height.equalTo(90)
        }
        play2Button1.snp.makeConstraints {
            $0.top.equalTo(circlePanel.snp.bottom).offset(120)
            $0.trailing.equalTo(self.view.snp.trailing).offset(-50)
            $0.width.height.equalTo(90)
        }
        play2Button2.snp.makeConstraints {
            $0.top.equalTo(play2Button1.snp.bottom).offset(20)
            $0.trailing.equalTo(self.view.snp.trailing).offset(-50)
            $0.width.height.equalTo(90)
        }
        play2Button3.snp.makeConstraints {
            $0.top.equalTo(play2Button2.snp.bottom).offset(20)
            $0.trailing.equalTo(self.view.snp.trailing).offset(-50)
            $0.width.height.equalTo(90)
        }
    }
    // 버튼 누름 효과
    @objc func buttonHighlighted(_ sender: UIButton) {
        sender.backgroundColor = playColor.withAlphaComponent(0.7) // 버튼이 눌렸을 때의 색상
    }
    @objc func buttonNormal(_ sender: UIButton) {
        sender.backgroundColor = playColor // 버튼이 정상 상태일 때의 색상
    }
    // Button Action
    @objc func buttonTapped(_ sender: UIButton) {
        // 버튼의 타이틀을 숫자로 변환하여 gameNumber를 증가시킵니다
        if let buttonTitle = sender.title(for: .normal),
           let buttonNumber = Int(buttonTitle) {
            gameNumber += buttonNumber
            gameNumLabel.text = "\(gameNumber)"
        }
    }
}




/**
 Layout 미리보기 - SwiftUI를 사용
 미리보기 창 열기: Opt + Cmd + Enter
 */
#if DEBUG
import SwiftUI
struct BaskinViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    BaskinViewController()
    }
}
@available(iOS 13.0, *)
struct BaskinViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            BaskinViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("BaskinVCPreView")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
        }
        
    }
} #endif
