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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor2
        
        circlePanelSetup()
        gameNumLabelSetup()
        
    }
    
    func circlePanelSetup() {
        circlePanel.backgroundColor = laColor1
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
        gameNumLabel.text = "0"
        gameNumLabel.textColor = numColor1
        gameNumLabel.font = UIFont.systemFont(ofSize: 100)
        gameNumLabel.textAlignment = .center
        self.view.addSubview(gameNumLabel)
        
        gameNumLabel.snp.makeConstraints {
            $0.width.height.equalTo(130)
            $0.center.equalTo(circlePanel)
        }
    }
    
    func play11Setup() {
        
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
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
        }
        
    }
} #endif
