//
//  UIView+.swift
//  Week2
//
//  Created by 김승원 on 10/12/24.
//

import UIKit

extension UIView {
    
    // UIView 여러 개 인자로 받아서 한 번에 addSubview하는 메소드
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // 그림자 함수
    func setShadow(opacity: Float, Radius: CGFloat, offSet: CGSize) {
      self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
      self.layer.shadowOpacity = opacity
      self.layer.shadowRadius = Radius / 2  //반경 (피그마랑 비슷하게 가려면 절반을 나눠야 함..)
      self.layer.shadowOffset = offSet
      self.layer.masksToBounds = false
    }
}
