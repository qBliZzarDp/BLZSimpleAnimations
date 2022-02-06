//
//  BLZSquares.swift
//  Animations
//
//  Created by Алексей Филатов on 25.01.2022.
//

import UIKit

class BLZSquares: BLZAnimationProtocol {
    func addAnimation(on layer: CALayer, color: UIColor) {
        squares(layer: layer, size: CGSize(width: layer.bounds.width / 3, height: layer.bounds.height / 3), color: color)
    }

    private func squares(layer: CALayer, size: CGSize, color: UIColor) {
        // Create 4 squares
        let square = Shapes.square.createShape(size: size, color: color)
        let secSquare = Shapes.square.createShape(size: size, color: color)
        let theSquare = Shapes.square.createShape(size: size, color: color)
        let fouSquare = Shapes.square.createShape(size: size, color: color)

        // Create 4 Animations
        let firstSquareAnimation: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position"
            animation.values = [CGPoint(x: 0, y: 0),
                                CGPoint(x: -size.width, y: 0),
                                CGPoint(x: -size.width, y: size.width),
                                CGPoint(x: 0, y: size.width),
                                CGPoint(x: 0, y: 0)]
            animation.duration = 2
            animation.repeatCount = HUGE
            animation.isAdditive = true
            animation.isRemovedOnCompletion = false
            animation.timingFunctions = [.easeInEaseOut, .easeInEaseOut, .easeInEaseOut, .easeInEaseOut]
            return animation
        }()
        let secondSquareAnimation: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position"
            animation.values = [CGPoint(x: 0, y: 0),
                                CGPoint(x: 0, y: size.width),
                                CGPoint(x: size.width, y: size.width),
                                CGPoint(x: size.width, y: 0),
                                CGPoint(x: 0, y: 0)]
            animation.duration = 2
            animation.repeatCount = HUGE
            animation.isAdditive = true
            animation.isRemovedOnCompletion = false
            animation.timingFunctions = [.easeInEaseOut, .easeInEaseOut, .easeInEaseOut, .easeInEaseOut]
            return animation
        }()
        let thirdSquareAnimation: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position"
            animation.values = [CGPoint(x: 0, y: 0),
                                CGPoint(x: size.width, y: 0),
                                CGPoint(x: size.width, y: -size.width),
                                CGPoint(x: 0, y: -size.width),
                                CGPoint(x: 0, y: 0)]
            animation.duration = 2
            animation.repeatCount = HUGE
            animation.isAdditive = true
            animation.isRemovedOnCompletion = false
            animation.timingFunctions = [.easeInEaseOut, .easeInEaseOut, .easeInEaseOut, .easeInEaseOut]
            return animation
        }()
        let fourthSquareAnimation: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position"
            animation.values = [CGPoint(x: 0, y: 0),
                                CGPoint(x: 0, y: -size.width),
                                CGPoint(x: -size.width, y: -size.width),
                                CGPoint(x: -size.width, y: 0),
                                CGPoint(x: 0, y: 0)]
            animation.duration = 2
            animation.repeatCount = HUGE
            animation.isAdditive = true
            animation.isRemovedOnCompletion = false
            animation.timingFunctions = [.easeInEaseOut, .easeInEaseOut, .easeInEaseOut, .easeInEaseOut]
            return animation
        }()
        let transformAnimation: CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "cornerRadius"
            animation.values = [size.width / 2, 0, 0, 0, 0, size.width / 2]
            animation.keyTimes = [0, 0.1, 0.6, 0.9, 0.99, 1]
            animation.repeatCount = HUGE
            animation.duration = 2
            animation.timingFunction = .easeInEaseOut
            animation.isRemovedOnCompletion = false
            animation.isAdditive = true //?
            return animation
        }()
        // MARK: - Frame settings
        let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                           y: (layer.bounds.size.height - size.height) / 2,
                           width: size.width,
                           height: size.height)
        square.frame = frame
        secSquare.frame = frame
        theSquare.frame = frame
        fouSquare.frame = frame
        square.masksToBounds = true
        secSquare.masksToBounds = true
        theSquare.masksToBounds = true
        fouSquare.masksToBounds = true
        // MARK: - Add animation and sublayers
        square.add(firstSquareAnimation, forKey: "position")
        square.add(transformAnimation, forKey: "cornerRadius")
        secSquare.add(secondSquareAnimation, forKey: "position")
        secSquare.add(transformAnimation, forKey: "cornerRadius")
        theSquare.add(thirdSquareAnimation, forKey: "position")
        theSquare.add(transformAnimation, forKey: "cornerRadius")
        fouSquare.add(fourthSquareAnimation, forKey: "position")
        fouSquare.add(transformAnimation, forKey: "cornerRadius")
        layer.addSublayer(square)
        layer.addSublayer(secSquare)
        layer.addSublayer(theSquare)
        layer.addSublayer(fouSquare)
    }
    }


