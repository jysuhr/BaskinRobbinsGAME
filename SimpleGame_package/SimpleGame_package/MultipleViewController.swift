//
//  MultiplicationViewController.swift
//  SimpleGame_package
//
//  Created by 서준영 on 8/25/24.
//

import UIKit
import SnapKit

class MultipleViewController: UIViewController {
    
    let dynamicWatch = UIView()
    let remainTimeLabel = UILabel()
    let timerLabel = UILabel()
    let textPanel = UIView()
    let quizzLabel = UILabel()
    let inputLabel = UILabel()
    
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

    var inputNum = ""
    var timer: Timer?
    var remainingSeconds = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor3
        
        dynamicWatchSetup()
        textPanelSetup()
        numberpadSetup()
        quizzLabelSetup()
        inputLabelSetup()
    }
    
    func dynamicWatchSetup() {
        /// 다이나믹 아일랜드
        dynamicWatch.backgroundColor = .black
        dynamicWatch.layer.cornerRadius = 36.53 / 2
        self.dynamicWatch.clipsToBounds = true
        self.view.addSubview(dynamicWatch)
        
        /// 제한시간 레이블
        remainTimeLabel.text = "제한시간"
        remainTimeLabel.textColor = laColor1
        remainTimeLabel.font = UIFont.systemFont(ofSize: 14)
        remainTimeLabel.textAlignment = .center
        self.view.addSubview(remainTimeLabel)
        
        /// 타이머 레이블
        timerLabel.text = "30"
        timerLabel.textColor = .red
        timerLabel.font = UIFont.systemFont(ofSize: 20)
        timerLabel.textAlignment = .center
        self.view.addSubview(timerLabel)
        
        dynamicWatch.snp.makeConstraints {
            $0.width.equalTo(126)
            $0.height.equalTo(36.53)
            $0.top.equalTo(self.view.snp.top).offset(11)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
        remainTimeLabel.snp.makeConstraints {
            $0.bottom.equalTo(dynamicWatch.snp.bottom).offset(-4)
            $0.width.equalTo(55)
            $0.height.equalTo(25)
            $0.leading.equalTo(dynamicWatch.snp.leading).offset(10)
        }
        timerLabel.snp.makeConstraints {
            $0.centerY.equalTo(remainTimeLabel.snp.centerY)
            $0.width.equalTo(30)
            $0.height.equalTo(25)
            $0.trailing.equalTo(dynamicWatch.snp.trailing).offset(-8)
        }
        dynamicIslandAnimation()
        
    }
    private func dynamicIslandAnimation() {
        /// DynamicIsland 확장 애니메이션 적용
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.2, delay: 0, options: .curveEaseInOut, animations: {
                /// DynamicIsland가 좌우로 확장
                self.dynamicWatch.snp.updateConstraints {
                    $0.height.equalTo(72)
                }

                // 레이아웃 강제 업데이트
                self.view.layoutIfNeeded()
            }) { completed in
                // 애니메이션이 완료된 후의 동작
                print("DynamicIsland was extended")
            }
        }
    }
    
    func textPanelSetup() {
        textPanel.backgroundColor = panelColor
        textPanel.layer.cornerRadius = 18
        self.view.addSubview(textPanel)
        
        textPanel.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(200)
            $0.top.equalTo(self.view.snp.top).offset(90)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    /*
    // 타이머 시작
    func startTimer() {
        timer?.invalidate()
        remainingSeconds = 10
        timerLabel.text = "\(remainingSeconds)"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // 타이머 갱신
    @objc func updateTimer() {
        remainingSeconds -= 1
        timerLabel.text = "\(remainingSeconds)"
        
        if remainingSeconds <= 0 {
            timer?.invalidate()
            startTimer()
        }
    }
     */
    
    func quizzLabelSetup() {
        quizzLabel.textColor = txtColor2
        quizzLabel.text = "3 x 4"
        quizzLabel.textAlignment = .center
        quizzLabel.font = UIFont.systemFont(ofSize: 50)
        self.view.addSubview(quizzLabel)
        quizzLabel.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(60)
            $0.center.equalTo(textPanel.snp.center)
        }
    }
    
    func inputLabelSetup() {
        inputLabel.textColor = txtColor2
        inputLabel.text = inputNum // TODO: placeholder 배치
        inputLabel.textAlignment = .center
        inputLabel.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(inputLabel)
        inputLabel.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(35)
            $0.centerX.equalTo(textPanel.snp.centerX)
            $0.top.equalTo(quizzLabel.snp.bottom).offset(10)
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
        // 버튼의 타이틀을 숫자로 변환하여 inputLabel에 입력
        if let buttonTitle = sender.title(for: .normal) {
            inputNum += buttonTitle
            inputLabel.text = inputNum
            inputLabelSetup()
        }
    }
    
    @objc func deleteCh() {
        // 마지막 문자 지우고, inputLabel업데이트
        if !inputNum.isEmpty {
            inputNum.removeLast()
            inputLabel.text = inputNum
        }
    }
}



extension MultipleViewController {
    func numberpadSetup() {
        let buttons = [button1, button2, button3,
                       button4, button5, button6,
                       button7, button8, button9, button0]
        buttons.forEach {
            $0.backgroundColor = numberButtonColor
            $0.layer.cornerRadius = 16
            $0.setTitleColor(self.txtColor1, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 50)
            $0.addTarget(self, action: #selector(buttonTapped(_: )), for: .touchUpInside)
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
            $0.setTitleColor(self.txtColor1, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 50)
//            $0.addTarget(self, action: #selector(buttonTapped(_: )), for: .touchUpInside)
            $0.addTarget(self, action: #selector(buttonHighlighted(_:)), for: [.touchDown, .touchDragEnter])
            $0.addTarget(self, action: #selector(buttonNormal(_:)), for: [.touchUpInside, .touchDragExit, .touchCancel])
            self.view.addSubview($0)
            $0.snp.makeConstraints {
                $0.width.equalTo(69)
                $0.height.equalTo(195)
            }
        }
        buttonDe.addTarget(self, action: #selector(deleteCh), for: .touchUpInside)
        
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
//        buttonDe.setTitle("<-", for: .normal) // TODO: backspaceIcon으로 교체
        buttonDe.setImage(deleteImage, for: .normal)
        buttonDe.tintColor = txtColor2
        buttonDe.imageView?.contentMode = .scaleAspectFit
        buttonEn.setTitle("En", for: .normal)
        
        button1.snp.makeConstraints {
            $0.top.equalTo(textPanel.snp.bottom).offset(71)
            $0.leading.equalTo(self.view.snp.leading).offset(37)
        }
        button2.snp.makeConstraints {
            $0.top.equalTo(textPanel.snp.bottom).offset(71)
            $0.leading.equalTo(button1.snp.trailing).offset(15)
        }
        button3.snp.makeConstraints {
            $0.top.equalTo(textPanel.snp.bottom).offset(71)
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
            $0.top.equalTo(textPanel.snp.bottom).offset(71)
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
struct MultipleViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    MultipleViewController()
    }
}
@available(iOS 13.0, *)
struct MultipleViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            MultipleViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("MultipleVCPreView")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
        }
        
    }
} #endif
