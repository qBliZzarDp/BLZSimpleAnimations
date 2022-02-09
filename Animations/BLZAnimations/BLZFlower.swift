//
//  BLZFlower.swift
//  Animations
//
//  Created by Алексей Филатов on 05.02.2022.
//

import UIKit

class BLZFlower: BLZAnimationProtocol {
    func addAnimation(on layer: CALayer, color: UIColor) {
        addflowerPot(layer, size: layer.bounds.size, color: color)
    }

    private func addflowerPot(_ layer: CALayer, size: CGSize, color: UIColor) {
        let flowerSize = size.width / 2
        let flowerPotSize = size.width / 2
        let flowerPotDuration: CFTimeInterval = 3
        // Draw flowerPot,Flower and mask
        let flowerPot = Shapes.flowerPot.createShape(size: CGSize(width: flowerPotSize, height: flowerPotSize), color: color)
        let flower = Shapes.flower.createShape(size: CGSize(width: flowerSize, height: flowerSize), color: color)
        let mask = Shapes.mask.createShape(size: CGSize(width: layer.bounds.width, height: layer.bounds.height), color: color)

        let flowerPosition: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "position.y"
            keyframeAnimation.values = [0, -flowerSize, -flowerSize, 0]
            keyframeAnimation.keyTimes = [0.20, 0.55, 0.65, 1]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.duration = flowerPotDuration
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isAdditive = true
            keyframeAnimation.isRemovedOnCompletion = false
            return keyframeAnimation
        }()

        let flowerPotStrokeStart: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "strokeStart"
            animation.values = [0, 0.200, 0.200, 0]
            animation.keyTimes = [0.20, 0.55, 0.65, 1]
            animation.timingFunction = .linear
            animation.duration = flowerPotDuration
            animation.repeatCount = .greatestFiniteMagnitude
            animation.isRemovedOnCompletion = false
            return animation
        }()

        let flowerPotStrokeEnd: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "strokeEnd"
            animation.values = [1, 0.800, 0.800, 1]
            animation.keyTimes = [0.20, 0.55, 0.65, 1]
            animation.timingFunction = .linear
            animation.duration = flowerPotDuration
            animation.repeatCount = .greatestFiniteMagnitude
            animation.isRemovedOnCompletion = false
            return animation
        }()

        // Animation group
        let animation = CAAnimationGroup()
        animation.animations = [flowerPotStrokeStart, flowerPotStrokeEnd]
        animation.duration = flowerPotDuration
        animation.repeatCount = .greatestFiniteMagnitude
        animation.isRemovedOnCompletion = false
        

        let frame = CGRect(x: (layer.bounds.size.width - flowerPotSize) / 2,
                           y: layer.bounds.size.height - flowerPotSize,
                           width: flowerPotSize,
                           height: flowerPotSize)
        
        let flowerFrame = CGRect(x: flowerPot.frame.midX,
                                 y: flowerPot.frame.maxY + (flower.bounds.height / 2),
                                 width: flowerSize,
                                 height: flowerSize)
        
        layer.mask?.frame = layer.frame
        layer.mask = mask
        flower.frame = flowerFrame
        flowerPot.frame = frame
        flower.add(flowerPosition, forKey: "position.y")
        flowerPot.add(animation, forKey: "animation")
        layer.addSublayer(flowerPot)
        layer.addSublayer(flower)
    }
}
