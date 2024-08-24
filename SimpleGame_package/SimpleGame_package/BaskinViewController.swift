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
    var gameNumber = 0
    var turnNumber: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor2
        
        circlePanelSetup()
        gameNumLabelSetup()
        playButtonSetup()
        updateButtonState()
//        gameOverLabelSetup()
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
            switch turnNumber {
            case true:
                $0.isUserInteractionEnabled = true
                $0.backgroundColor = playColor
            case false:
                $0.isUserInteractionEnabled = false
                $0.backgroundColor = playColorDis
            }
        }
        
        buttons2.forEach {
            switch turnNumber {
            case true:
                $0.isUserInteractionEnabled = false
                $0.backgroundColor = playColorDis
            case false:
                $0.isUserInteractionEnabled = true
                $0.backgroundColor = playColor
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
                gameOverLabelSetup()
                gameOver()
            }
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
