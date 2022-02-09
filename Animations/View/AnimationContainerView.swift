//
//  AnimationContainerView.swift
//  Animations
//
//  Created by Алексей Филатов on 05.02.2022.
//

import UIKit

public final class AnimationContainerView: UIView {
    
    init(frame: CGRect, backgroundColor: UIColor? = .white) {
        super.init(frame: frame)
        self.backgroundColor = backgroundColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAnimation(animation: Animations, color: UIColor) {
        switch animation {
        case .dropFall:
            return animation.animateCases().addAnimation(on: self.layer, color: color)
        case .fourSquares:
            return animation.animateCases().addAnimation(on: self.layer, color: color)
        case .flower:
            return animation.animateCases().addAnimation(on: self.layer, color: color)
        case .load:
            return animation.animateCases().addAnimation(on: self.layer, color: color)
        case .ship:
            return animation.animateCases().addAnimation(on: self.layer, color: color)
        }
    }

}
