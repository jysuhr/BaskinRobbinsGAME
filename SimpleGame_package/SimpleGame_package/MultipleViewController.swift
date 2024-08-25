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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor3
        
        dynamicWatchSetup()
    }
    
    func dynamicWatchSetup() {
        dynamicWatch.backgroundColor = .black
        dynamicWatch.layer.cornerRadius = 36.53 / 2
        self.dynamicWatch.clipsToBounds = true
        self.view.addSubview(dynamicWatch)
        
        dynamicWatch.snp.makeConstraints {
            $0.width.equalTo(124)
            $0.height.equalTo(36.53)
            $0.top.equalTo(self.view.snp.top).offset(11)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
        dynamicIslandAnimation()
        
    }
    
    private func dynamicIslandAnimation() {
        /// DynamicIsland 확장 애니메이션 적용
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.4, delay: 0.5, options: .curveEaseInOut, animations: {
                /// DynamicIsland가 좌우로 확장
                self.dynamicWatch.snp.updateConstraints {
                    $0.width.equalTo(250)
                }
                // 레이아웃 강제 업데이트
                self.view.layoutIfNeeded()
            }) { completed in
                // 애니메이션이 완료된 후의 동작
                print("DynamicIsland was extended")
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
