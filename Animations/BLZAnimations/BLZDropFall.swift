//
//  BLZDropFall.swift
//  Animations
//
//  Created by Алексей Филатов on 01.02.2022.
//

import UIKit

class BLZDropFall: BLZAnimationProtocol {
    func addAnimation(on layer: CALayer, color: UIColor) {
        animation(layer: layer, size: CGSize(width: layer.bounds.width / 4, height: layer.bounds.height / 4), color: color)
    }

    private func animation(layer: CALayer, size: CGSize, color: UIColor) {
        let drop = Shapes.dropWithMask.createShape(size: CGSize(width: size.width / 2, height: size.height / 2), color: color)
        let wave = Shapes.oval.createShape(size: size, color: color)
        let secondWave = Shapes.oval.createShape(size: size, color: color)
        let mask = Shapes.mask.createShape(size: layer.bounds.size, color: color)

        let dropPosition: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position"
            animation.values = [CGPoint(x: 0, y: -size.height),
                                CGPoint(x: 0, y: layer.frame.size.height / 4),
                                CGPoint(x: 0, y: layer.frame.size.height / 2),
                                CGPoint(x: 0, y: layer.frame.size.height / 1.5)]
            animation.keyTimes = [0, 0.3, 0.4, 0.5]
            animation.timingFunction = .linear
            animation.duration = 2
            animation.repeatCount = .greatestFiniteMagnitude
            animation.isAdditive = true
            animation.isRemovedOnCompletion = false
            return animation
        }()

        let positionMask: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "position.y"
            keyframeAnimation.values = [0, -size.height]
            keyframeAnimation.keyTimes = [0.37, 0.5]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.duration = 2
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isAdditive = true
            keyframeAnimation.isRemovedOnCompletion = false
            return keyframeAnimation
        }()

        let waveSize: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.scale"
            animation.values = [0.0, 0.05, 1.2]
            animation.keyTimes = [0, 0.21, 0.69]
            animation.duration = 4
            animation.repeatCount = .greatestFiniteMagnitude
            animation.isAdditive = true
            animation.isRemovedOnCompletion = false
            animation.timingFunction = .linear
            return animation
        }()

        let waveOpacity: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "opacity"
            animation.values = [0.0, 1, 0]
            animation.keyTimes = [0.20, 0.21, 0.69]
            animation.duration = 4
            animation.repeatCount = .greatestFiniteMagnitude
            animation.isAdditive = true
            animation.isRemovedOnCompletion = false
            animation.timingFunction = .linear
            return animation
        }()

        let secWaveSize: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.scale"
            animation.values = [0.0, 0.05, 1.2]
            animation.keyTimes = [0.70, 0.71, 1]
            animation.duration = 4
            animation.repeatCount = .greatestFiniteMagnitude
            animation.isAdditive = true
            animation.isRemovedOnCompletion = false
            animation.timingFunction = .linear
            return animation
        }()

        let secWaveOpacity: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "opacity"
            animation.values = [0, 1, 0]
            animation.keyTimes = [0.70, 0.71, 1]
            animation.duration = 4
            animation.repeatCount = .greatestFiniteMagnitude
            animation.isAdditive = true
            animation.isRemovedOnCompletion = false
            animation.timingFunction = .linear
            return animation
        }()

        // MARK: - Frame settings
        let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                           y: (layer.bounds.size.height - size.height / 4) / 2,
                           width: size.width,
                           height: size.height)

        let dropFrame = CGRect(x: (layer.bounds.size.width - size.width / 2) / 2,
                           y: 0,
                           width: size.width,
                           height: size.height)

        secondWave.opacity = 0.0
        wave.opacity = 0.0

        drop.frame = dropFrame
        wave.frame = frame
        secondWave.frame = frame

        drop.mask?.add(positionMask, forKey: "position.y")
        drop.add(dropPosition, forKey: "position")
        wave.add(waveSize, forKey: "transform.scale")
        wave.add(waveOpacity, forKey: "opacity")
        secondWave.add(secWaveSize, forKey: "transform.scale")
        secondWave.add(secWaveOpacity, forKey: "opacity")

        layer.mask = mask
        layer.addSublayer(drop)
        layer.addSublayer(wave)
        layer.addSublayer(secondWave)
    }
}


