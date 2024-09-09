//
//  UpDownViewController.swift
//  SimpleGame_package
//
//  Created by 서준영 on 9/9/24.
//

import UIKit
import SnapKit

class UpDownViewController: UIViewController {
    
    let gamePanel = UIView()
    let gameInfoLabel = UILabel()
    
    /// 넘버패드
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let button0 = UIButton()
    let buttonDe = UIButton()
    let buttonEn = UIButton()
    let deleteImage = UIImage(named: "backspaceIcon")?.withRenderingMode(.alwaysTemplate)
    
    var targetNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRandomNum()
        self.view.backgroundColor = bgColor4
        gamePanelSetup()
        gameInfoLabelSetup()
        numberpadSetup()
    }
    
    func makeRandomNum() {
        targetNum = Int.random(in: 1...100)
    }
    
    func gamePanelSetup() {
        gamePanel.backgroundColor = panelColor
        gamePanel.layer.cornerRadius = 18
        self.view.addSubview(gamePanel)
        
        gamePanel.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(90)
        }
    }
    
    func gameInfoLabelSetup() {
        gameInfoLabel.textColor = txtColorBk
        gameInfoLabel.text = "숫자를 입력하세요\n(1~100)"
        gameInfoLabel.numberOfLines = 0
        gameInfoLabel.textAlignment = .center
        // 초기 placeholder
        gameInfoLabel.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(gameInfoLabel)
        
        gameInfoLabel.snp.makeConstraints {
            $0.center.equalTo(gamePanel.snp.center)
            $0.width.equalTo(275)
            $0.height.equalTo(89)
        }
    }
    
    // 버튼 누름 효과
    @objc func buttonHighlighted(_ sender: UIButton) {
        sender.backgroundColor = numberButtonColor.withAlphaComponent(0.7) // 버튼이 눌렸을 때의 색상
    }
    @objc func buttonNormal(_ sender: UIButton) {
        sender.backgroundColor = numberButtonColor // 버튼이 정상 상태일 때의 색상
    }
    
    // Button Action
    @objc func buttonTapped(_ sender: UIButton) {
         /**
          입력한 숫자와 targetNum이 같은지 판단 & Up Down 알려주기
          */
    }
    
}

extension UpDownViewController {
    func numberpadSetup() {
        let buttons = [button1, button2, button3,
                       button4, button5, button6,
                       button7, button8, button9, button0]
        buttons.forEach {
            $0.backgroundColor = numberButtonColor
            $0.layer.cornerRadius = 16
            $0.setTitleColor(self.txtColorBk, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 50)
//            $0.addTarget(self, action: #selector(buttonTapped(_: )), for: .touchUpInside)
            $0.addTarget(self, action: #selector(buttonHighlighted(_:)), for: [.touchDown, .touchDragEnter])
            $0.addTarget(self, action: #selector(buttonNormal(_:)), for: [.touchUpInside, .touchDragExit, .touchCancel])
            self.view.addSubview($0)

        }
        let button0x = [button1, button2, button3,
                        button4, button5, button6,
                        button7, button8, button9]
        button0x.forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(69)
                $0.height.equalTo(90)
            }
        }
        
        let fnButtons = [buttonDe, buttonEn]
        fnButtons.forEach {
            $0.backgroundColor = numberButtonColor
            $0.layer.cornerRadius = 16
            $0.setTitleColor(self.txtColorBk, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 50)
            $0.addTarget(self, action: #selector(buttonHighlighted(_:)), for: [.touchDown, .touchDragEnter])
            $0.addTarget(self, action: #selector(buttonNormal(_:)), for: [.touchUpInside, .touchDragExit, .touchCancel])
            self.view.addSubview($0)
            $0.snp.makeConstraints {
                $0.width.equalTo(69)
                $0.height.equalTo(195)
            }
        }
//        buttonDe.addTarget(self, action: #selector(deleteCh), for: .touchUpInside)
//        buttonEn.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
        
        button1.setTitle("1", for: .normal)
        button2.setTitle("2", for: .normal)
        button3.setTitle("3", for: .normal)
        button4.setTitle("4", for: .normal)
        button5.setTitle("5", for: .normal)
        button6.setTitle("6", for: .normal)
        button7.setTitle("7", for: .normal)
        button8.setTitle("8", for: .normal)
        button9.setTitle("9", for: .normal)
        button0.setTitle("0", for: .normal)
        buttonDe.setImage(deleteImage, for: .normal)
        buttonDe.tintColor = txtColorBk
        buttonDe.imageView?.contentMode = .scaleAspectFit
        buttonEn.setTitle("En", for: .normal)
        
        button1.snp.makeConstraints {
            $0.top.equalTo(gamePanel.snp.bottom).offset(71)
            $0.leading.equalTo(self.view.snp.leading).offset(37)
        }
        button2.snp.makeConstraints {
            $0.top.equalTo(gamePanel.snp.bottom).offset(71)
            $0.leading.equalTo(button1.snp.trailing).offset(15)
        }
        button3.snp.makeConstraints {
            $0.top.equalTo(gamePanel.snp.bottom).offset(71)
            $0.leading.equalTo(button2.snp.trailing).offset(15)
        }
        button4.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(15)
            $0.centerX.equalTo(button1.snp.centerX)
        }
        button5.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(15)
            $0.centerX.equalTo(button2.snp.centerX)
        }
        button6.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(15)
            $0.centerX.equalTo(button3.snp.centerX)
        }
        button7.snp.makeConstraints {
            $0.top.equalTo(button4.snp.bottom).offset(15)
            $0.centerX.equalTo(button1.snp.centerX)
        }
        button8.snp.makeConstraints {
            $0.top.equalTo(button4.snp.bottom).offset(15)
            $0.centerX.equalTo(button2.snp.centerX)
        }
        button9.snp.makeConstraints {
            $0.top.equalTo(button4.snp.bottom).offset(15)
            $0.centerX.equalTo(button3.snp.centerX)
        }
        button0.snp.makeConstraints {
            $0.width.equalTo(237)
            $0.height.equalTo(90)
            $0.top.equalTo(button7.snp.bottom).offset(15)
            $0.leading.equalTo(button1.snp.leading)
        }
        
        buttonDe.snp.makeConstraints {
            $0.top.equalTo(gamePanel.snp.bottom).offset(71)
            $0.leading.equalTo(button3.snp.trailing).offset(15)
        }
        buttonEn.snp.makeConstraints {
            $0.top.equalTo(buttonDe.snp.bottom).offset(15)
            $0.leading.equalTo(button3.snp.trailing).offset(15)
        }
        
    }
}





//MARK: -
/**
 Layout 미리보기 - SwiftUI를 사용
 미리보기 창 열기: Opt + Cmd + Enter
 */
#if DEBUG
import SwiftUI
struct UpDownViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    UpDownViewController()
    }
}
@available(iOS 13.0, *)
struct UpDownViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            UpDownViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("UpDownVCPreView")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
        }
        
    }
} #endif
