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
    let gameOverLabel = UILabel()
    let winnerLabel = UILabel()
    
    let dynamicWatch = UIView()
    let remainTimeLabel = UILabel()
    let timerLabel = UILabel()
    
    var gameNumber = 0
    var turnNumber: Bool = true
    
    var timer: Timer?
    var remainingSeconds = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor2
        
        circlePanelSetup()
        gameNumLabelSetup()
        playButtonSetup()
        updateButtonState()
        dynamicWatchSetup()
        startTimer()
    }
    
    func circlePanelSetup() {
        switch gameNumber {
        case 0...10:
            circlePanel.backgroundColor = laColor1
        case 11...20:
            circlePanel.backgroundColor = laColor2
        case 21...25:
            circlePanel.backgroundColor = laColor3
        case 26...29:
            circlePanel.backgroundColor = laColor4
        case 30...:
            circlePanel.backgroundColor = laColor5
        default:
            circlePanel.backgroundColor = .black
        }
        
        circlePanel.layer.cornerRadius = 250 / 2
        circlePanel.clipsToBounds = true
        if circlePanel.superview == nil {
            self.view.addSubview(circlePanel)
        }

        circlePanel.snp.makeConstraints {
            $0.width.height.equalTo(250)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(90)
        }
    }

    func gameOver() {
        // 애니메이션 적용
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            // Corner radius는 원형이 유지되도록 적절히 조정
            self.circlePanel.layer.cornerRadius = 0
            self.circlePanel.clipsToBounds = true
            
            // circlePanel의 제약 조건을 전체 화면을 덮도록 변경
            self.circlePanel.snp.remakeConstraints {
                $0.edges.equalToSuperview() // Superview의 전체를 덮도록 설정
            }
            
            // gameNumLabel보이지 않게 설정
            self.gameNumLabel.isHidden = true
            
            // 레이아웃 강제 업데이트
            self.view.layoutIfNeeded()
        }) { completed in
            // 애니메이션이 완료된 후의 동작
            print("Circle panel has expanded to cover the entire screen.")
        }

        UIView.animate(withDuration: 1.4, delay: 0, options: .curveEaseInOut, animations: {
            /// DynamicIsland가 좌우로 축소
            self.dynamicWatch.snp.updateConstraints {
                $0.height.equalTo(36.53)
            }
            // 레이아웃 강제 업데이트
            self.view.layoutIfNeeded()
        }) { completed in
            // 애니메이션이 완료된 후의 동작
            print("DynamicIsland was disappeared")
        }
    }

    func gameNumLabelSetup() {
        gameNumLabel.text = "\(gameNumber)"
        switch gameNumber {
        case 0...10:
            gameNumLabel.textColor = numColor1
        case 11...20:
            gameNumLabel.textColor = numColor1
        case 21...25:
            gameNumLabel.textColor = numColor2
        case 26...29:
            gameNumLabel.textColor = numColor3
        case 30...:
            gameNumLabel.textColor = numColor3
        default:
            gameNumLabel.textColor = .white
        }
        gameNumLabel.font = UIFont.systemFont(ofSize: 100)
        gameNumLabel.textAlignment = .center
        
        if gameNumLabel.superview == nil {
            self.view.addSubview(gameNumLabel)
        }
        
        gameNumLabel.snp.makeConstraints {
            $0.width.height.equalTo(130)
            $0.center.equalTo(circlePanel)
        }
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
        timerLabel.text = "10"
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
    
    
    func gameOverLabelSetup() {
        switch turnNumber {
        case true:
            winnerLabel.text = "Player 1 WIN"
        case false:
            winnerLabel.text = "Player 2 WIN"
        }
        winnerLabel.textAlignment = .left
        winnerLabel.textColor = laColor1
        winnerLabel.font = UIFont.systemFont(ofSize: 30)
        
        gameOverLabel.text = "Game\nOver !!"
        gameOverLabel.textAlignment = .left
        gameOverLabel.textColor = laColor1
        gameOverLabel.font = UIFont.systemFont(ofSize: 100)
        gameOverLabel.numberOfLines = 0
        self.view.addSubview(gameOverLabel)
        
        gameOverLabel.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(250)
            $0.center.equalTo(self.view.center)
        }
        
        if winnerLabel.superview == nil {
            self.view.addSubview(winnerLabel)
        }
        
        winnerLabel.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(40)
            $0.top.equalTo(gameOverLabel.snp.top).offset(-25)
            $0.leading.equalTo(gameOverLabel.snp.leading)
        }
    }
    
    func playButtonSetup() {
        let buttons = [play1Button1, play1Button2, play1Button3, play2Button1, play2Button2, play2Button3]
        buttons.forEach {
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
    
    func updateButtonState() {
        let buttons1 = [play1Button1, play1Button2, play1Button3]
        let buttons2 = [play2Button1, play2Button2, play2Button3]
        // turnNumber | true: player1, false: player2
        buttons1.forEach {
            $0.isUserInteractionEnabled = turnNumber
            $0.backgroundColor = turnNumber ? playColor : playColorDis
        }
        
        buttons2.forEach {
            $0.isUserInteractionEnabled = !turnNumber
            $0.backgroundColor = !turnNumber ? playColor : playColorDis
        }
    }
    
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
            turnNumber.toggle()
            updateButtonState()
            startTimer()
        }
    }

    // Button Action
    @objc func buttonTapped(_ sender: UIButton) {
        // 버튼의 타이틀을 숫자로 변환하여 gameNumber를 증가시킵니다
        if let buttonTitle = sender.title(for: .normal),
           let buttonNumber = Int(buttonTitle) {
            gameNumber += buttonNumber
            gameNumLabel.text = "\(gameNumber)"
            turnNumber.toggle()
            updateButtonState()
            circlePanelSetup()
            gameNumLabelSetup()
            if gameNumber >= 31 {
                timer?.invalidate() // 게임 오버시 타이머 멈춤
                gameOverLabelSetup()
                gameOver()
            } else {
                startTimer() // 버튼이 눌렸을 때 타이머 재시작
            }
        }
    }
    
    // 버튼 누름 효과
    @objc func buttonHighlighted(_ sender: UIButton) {
        sender.backgroundColor = playColor.withAlphaComponent(0.7) // 버튼이 눌렸을 때의 색상
    }
    @objc func buttonNormal(_ sender: UIButton) {
        sender.backgroundColor = playColorDis // 버튼이 정상 상태일 때의 색상
    }
}




//MARK: -
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
