//
//  BLZLoad.swift
//  Animations
//
//  Created by Алексей Филатов on 29.01.2022.
//

import UIKit

class BLZLoad: BLZAnimationProtocol {
    func addAnimation(on layer: CALayer, color: UIColor) {
        animateLetters(layer: layer, size: CGSize(width: layer.bounds.width / 3, height: layer.bounds.height / 3), color: color)
    }

    private func stick(size: CGSize, color: UIColor) -> CALayer {
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        path.lineWidth = 2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: size.width))
        layer.strokeColor = color.cgColor
        layer.lineWidth = 5.0
        layer.lineCap = .round
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return layer
    }

    private func halfStick(size: CGSize, color: UIColor) -> CALayer {
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        path.lineWidth = 2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: size.width / 2))
        layer.lineWidth = 5.0
        layer.lineCap = .round
        layer.strokeColor = color.cgColor
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return layer
    }

    private func dSticks(size: CGSize, color: UIColor) -> CALayer {
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        path.lineWidth = 2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: size.width / 4 ))
        layer.lineWidth = 5.0
        layer.lineCap = .round
        layer.strokeColor = color.cgColor
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return layer
    }

    private func animateLetters(layer: CALayer, size: CGSize, color: UIColor) {
        let separator = size.width / 5
        let lStick = stick(size: size, color: color)
        let lBottom = halfStick(size: size, color: color)
        let oLeft = stick(size: size, color: color)
        let oRight = stick(size: size, color: color)
        let oBottom = halfStick(size: size, color: color)
        let oTop = halfStick(size: size, color: color)
        let aLeft = stick(size: size, color: color)
        let aRight = stick(size: size, color: color)
        let aTop = halfStick(size: size, color: color)
        let aBottom = halfStick(size: size, color: color)
        let dStick = stick(size: size, color: color)
        let dTopHalf = halfStick(size: size, color: color)
        let dBotHalf = halfStick(size: size, color: color)
        let dCenterHalf = dSticks(size: size, color: color)

        lStick.frame = CGRect(x: layer.bounds.size.width / 10,
                              y: (layer.bounds.size.height - size.height) / 2,
                              width: size.width,
                              height: size.height)

        lBottom.frame = CGRect(x: lStick.frame.minX - (lBottom.bounds.height / 2),
                               y: lStick.frame.maxY - (lBottom.bounds.height / 2),
                               width: size.width,
                               height: size.height)

        oLeft.frame = CGRect(x: (lStick.frame.minX + separator) + (lBottom.bounds.height / 2),
                             y: (layer.bounds.size.height - size.height) / 2,
                             width: size.width,
                             height: size.height)

        oBottom.frame = CGRect(x: oLeft.frame.minX - (oBottom.bounds.height / 2),
                               y: oLeft.frame.maxY - (oBottom.bounds.height / 2),
                             width: size.width,
                             height: size.height)

        oRight.frame = CGRect(x: oLeft.frame.minX + (oBottom.bounds.height / 2),
                              y: (layer.bounds.size.height - size.height) / 2,
                              width: size.width,
                              height: size.height)
        oTop.frame = CGRect(x: oLeft.frame.minX - (oBottom.bounds.height / 2),
                            y: oRight.frame.minY - (oTop.bounds.height / 2),
                              width: size.width,
                              height: size.height)
        
        aLeft.frame = CGRect(x: oRight.frame.minX + separator,
                             y: (layer.bounds.size.height - size.height) / 2,
                               width: size.width,
                               height: size.height)
        aTop.frame  = CGRect(x: aLeft.frame.minX - (aTop.frame.height / 2),
                             y: aLeft.frame.minY - (aTop.frame.height / 2),
                               width: size.width,
                               height: size.height)
        aBottom.frame = CGRect(x: aLeft.frame.minX - (aBottom.bounds.height / 2),
                               y: aLeft.frame.midY - (aBottom.bounds.height / 2),
                                 width: size.width,
                                 height: size.height)
        aRight.frame = CGRect(x: aLeft.frame.minX + (aBottom.bounds.height / 2),
                              y: (layer.bounds.size.height - size.height) / 2,
                                width: size.width,
                                height: size.height)
        dStick.frame = CGRect(x: aRight.frame.minX + separator,
                              y: (layer.bounds.size.height - size.height) / 2,
                                width: size.width,
                                height: size.height)
        dBotHalf.frame = CGRect(x: (aRight.frame.minX + separator) - (dBotHalf.bounds.height / 2),
                                y: dStick.frame.maxY - (dBotHalf.bounds.height / 2),
                                  width: size.width,
                                  height: size.height)
        dTopHalf.frame = CGRect(x: (aRight.frame.minX + separator) - (dBotHalf.bounds.height / 2),
                                y: dStick.frame.minY - (dBotHalf.bounds.height / 2),
                                  width: size.width,
                                  height: size.height)
        dCenterHalf.frame = CGRect(x: dTopHalf.frame.minX + (size.height / 2) * sin(CGFloat.pi / 4),
                                   y: dStick.frame.minY - ((size.height / 4) / 2),
                                   width: size.width,
                                   height: size.height)

        lBottom.anchorPoint = CGPoint(x: 0, y: 0.5)
        oTop.anchorPoint = CGPoint(x: 0, y: 0)
        oBottom.anchorPoint = CGPoint(x: 0, y: 0.5)
        aTop.anchorPoint = CGPoint(x: 0, y: 0)
        aBottom.anchorPoint = CGPoint(x: 0, y: 0)
        dTopHalf.anchorPoint = CGPoint(x: 0, y: 0)
        dBotHalf.anchorPoint = CGPoint(x: 0, y: 0.5)
        dCenterHalf.anchorPoint = CGPoint(x: 0, y: 0)
        dCenterHalf.opacity = 0.0

        // Keyframe Animations for L
        let rotateL: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "transform.rotation.z"
            keyframeAnimation.values = [0, 0, CGFloat.pi / 4, CGFloat.pi / 3, CGFloat.pi / 2]
            keyframeAnimation.keyTimes = [0, 0.1, 0.20, 0.25, 0.30]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isRemovedOnCompletion = false
            keyframeAnimation.isAdditive = true
            keyframeAnimation.duration = 5
            keyframeAnimation.autoreverses = true
            return keyframeAnimation
        }()

        let rotateOTop: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "transform.rotation.z"
            keyframeAnimation.values = [0, 0, -CGFloat.pi / 4, -CGFloat.pi / 3, -CGFloat.pi / 2]
            keyframeAnimation.keyTimes = [0, 0.30, 0.35, 0.40, 0.45]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isRemovedOnCompletion = false
            keyframeAnimation.isAdditive = true
            keyframeAnimation.duration = 5
            keyframeAnimation.autoreverses = true
            return keyframeAnimation
        }()

        let rotateOBottom: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "transform.rotation.z"
            keyframeAnimation.values = [0, 0, CGFloat.pi / 4, CGFloat.pi / 3, CGFloat.pi / 2]
            keyframeAnimation.keyTimes = [0, 0.30, 0.35, 0.40, 0.45]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isRemovedOnCompletion = false
            keyframeAnimation.isAdditive = true
            keyframeAnimation.duration = 5
            keyframeAnimation.autoreverses = true
            return keyframeAnimation
        }()

        let rotateA: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "transform.rotation.z"
            keyframeAnimation.values = [0, 0, -CGFloat.pi / 4, -CGFloat.pi / 3, -CGFloat.pi / 2]
            keyframeAnimation.keyTimes = [0, 0.45, 0.50, 0.55, 0.65]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isRemovedOnCompletion = false
            keyframeAnimation.isAdditive = true
            keyframeAnimation.duration = 5
            keyframeAnimation.autoreverses = true
            return keyframeAnimation
        }()

        let rotateDTop: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "transform.rotation.z"
            keyframeAnimation.values = [0, 0, -CGFloat.pi / 6, -CGFloat.pi / 5, -CGFloat.pi / 4, -CGFloat.pi / 4]
            keyframeAnimation.keyTimes = [0, 0.65, 0.70, 0.75, 0.80]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isRemovedOnCompletion = false
            keyframeAnimation.isAdditive = true
            keyframeAnimation.duration = 5
            keyframeAnimation.autoreverses = true
            return keyframeAnimation
        }()

        let rotateDBottom: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "transform.rotation.z"
            keyframeAnimation.values = [0, 0, CGFloat.pi / 6, CGFloat.pi / 5, CGFloat.pi / 4, CGFloat.pi / 4]
            keyframeAnimation.keyTimes = [0, 0.65, 0.70, 0.75, 0.80]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isRemovedOnCompletion = false
            keyframeAnimation.isAdditive = true
            keyframeAnimation.duration = 5
            keyframeAnimation.autoreverses = true
            return keyframeAnimation
        }()

        let rotateDstick: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "transform.rotation.z"
            keyframeAnimation.values = [ 3 * CGFloat.pi / 4, 3 * CGFloat.pi / 4,  2 * CGFloat.pi / 3, CGFloat.pi / 4, 0, 0]
            keyframeAnimation.keyTimes = [0, 0.80, 0.85, 0.90, 0.95, 1]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isRemovedOnCompletion = false
            keyframeAnimation.isAdditive = true
            keyframeAnimation.duration = 5
            keyframeAnimation.autoreverses = true
            return keyframeAnimation
        }()

        let dStickOpacity: CAKeyframeAnimation = {
            let keyframeAnimation = CAKeyframeAnimation()
            keyframeAnimation.keyPath = "opacity"
            keyframeAnimation.values = [ 0.0, 0.0, 1.0, 1.0]
            keyframeAnimation.keyTimes = [0, 0.80, 0.81, 1]
            keyframeAnimation.timingFunction = .linear
            keyframeAnimation.repeatCount = .greatestFiniteMagnitude
            keyframeAnimation.isRemovedOnCompletion = false
            keyframeAnimation.isAdditive = true
            keyframeAnimation.duration = 5
            keyframeAnimation.autoreverses = true
            return keyframeAnimation
        }()

        lBottom.add(rotateL, forKey: "transform.rotation.z")
        oTop.add(rotateOTop, forKey: "transform.rotation.z")
        oBottom.add(rotateOBottom, forKey: "transform.rotation.z")
        aTop.add(rotateA, forKey: "transform.rotation.z")
        aBottom.add(rotateA, forKey: "transform.rotation.z")
        dTopHalf.add(rotateDTop, forKey: "transform.rotation.z")
        dBotHalf.add(rotateDBottom, forKey: "transform.rotation.z")
        dCenterHalf.add(rotateDstick, forKey: "transform.rotation.z")
        dCenterHalf.add(dStickOpacity, forKey: "opacity")

        layer.addSublayer(lStick)
        layer.addSublayer(lBottom)
        layer.addSublayer(oLeft)
        layer.addSublayer(oBottom)
        layer.addSublayer(oRight)
        layer.addSublayer(oTop)
        layer.addSublayer(aLeft)
        layer.addSublayer(aTop)
        layer.addSublayer(aBottom)
        layer.addSublayer(aRight)
        layer.addSublayer(dStick)
        layer.addSublayer(dBotHalf)
        layer.addSublayer(dTopHalf)
        layer.addSublayer(dCenterHalf)
    }
    
}
