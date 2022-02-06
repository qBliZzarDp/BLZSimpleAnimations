//
//  BLZShip.swift
//  Animations
//
//  Created by Алексей Филатов on 06.02.2022.
//

import UIKit

class BLZShip: BLZAnimationProtocol {
    func addAnimation(on layer: CALayer, color: UIColor) {
        addWave(layer, size: layer.bounds.size, color: color)
    }

    private func addWave(_ layer: CALayer, size: CGSize, color: UIColor) {
        let shipSize = size.width / 2
        let waveMask = Shapes.waveMask.createShape(size: size, color: color)
        let wave = Shapes.square.createShape(size: size, color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
        let ship = Shapes.ship.createShape(size: CGSize(width: shipSize, height: shipSize), color: color)
        let mask = Shapes.mask.createShape(size: size, color: color)

        let positionMask: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "position.x"
            keyframeAnimation.values = [0, -size.width]
            keyframeAnimation.keyTimes = [0, 1]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.duration = 2
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isAdditive = true
            keyframeAnimation.isRemovedOnCompletion = false
            return keyframeAnimation
        }()

        let rotateShip: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "transform.rotation.z"
            keyframeAnimation.values = [-CGFloat.pi / 20, CGFloat.pi / 20,
                                         -CGFloat.pi / 20, CGFloat.pi / 20,
                                         -CGFloat.pi / 20, CGFloat.pi / 20,
                                         -CGFloat.pi / 20]
            keyframeAnimation.keyTimes = [0, 0.166, 0.342, 0.498, 0.664, 0.830, 1]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isRemovedOnCompletion = false
            keyframeAnimation.isAdditive = true
            keyframeAnimation.duration = 4
            return keyframeAnimation
        }()

        let positionShip: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "position.x"
            keyframeAnimation.values = [0, size.height + shipSize]
            keyframeAnimation.keyTimes = [0, 1]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.duration = 4
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isAdditive = true
            keyframeAnimation.isRemovedOnCompletion = false
            return keyframeAnimation
        }()

        let shipFrame = CGRect(x: 0 - shipSize,
                               y: (layer.bounds.size.height - shipSize * 1.25) / 2,
                               width: shipSize,
                               height: shipSize)
        let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                           y: (layer.bounds.size.height - size.height) / 2,
                           width: size.width,
                           height: size.height)

        wave.mask = waveMask
        wave.mask?.add(positionMask, forKey: "position.x")
        wave.frame = frame

        ship.anchorPoint = CGPoint(x: 0.2, y: 0.5)
        ship.add(positionShip, forKey: "position.x")
        ship.add(rotateShip, forKey: "transform.rotation.z")
        ship.frame = shipFrame

        layer.mask = mask
        layer.addSublayer(ship)
        layer.addSublayer(wave)
    }
}
