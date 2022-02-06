//
//  BLZShapes.swift
//  Animations
//
//  Created by Алексей Филатов on 29.01.2022.
//

import UIKit

enum Shapes {
    case square
    case dropWithMask
    case oval
    case flowerPot
    case flower
    case waveMask
    case ship
    case mask
    
    func createShape(size: CGSize, color: UIColor) -> CALayer {
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        switch self {
        case .square:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            layer.fillColor = color.cgColor
        case .dropWithMask:
            let mask = CAShapeLayer()
            let maskPath = UIBezierPath()
            maskPath.move(to: CGPoint(x: 0, y: 0))
            maskPath.addLine(to: CGPoint(x: size.width, y: 0))
            maskPath.addLine(to: CGPoint(x: size.width, y: size.height * 1.8))
            maskPath.addLine(to: CGPoint(x: 0, y: size.height * 1.8))
            mask.path = maskPath.cgPath
            
            path.move(to: CGPoint(x: size.width / 2, y: 0))
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height * 1.2),
                        radius: size.width / 2, startAngle: 7 * CGFloat.pi / 6 ,
                        endAngle: 11 * CGFloat.pi / 6,
                        clockwise: false)
            layer.fillColor = color.cgColor
            layer.mask = mask
        case .oval:
            let oval = UIBezierPath(ovalIn: CGRect(x: 0, y: size.height / 2, width: size.width, height: size.height / 4))
            layer.fillColor = nil
            layer.backgroundColor = nil
            layer.strokeColor =  color.cgColor
            layer.lineWidth = 3.0
            layer.lineCap = .round
            layer.path = oval.cgPath
            layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            return layer
        case .flowerPot:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2), radius: size.width / 4, startAngle: 4.71238898038 , endAngle: 4.71238898037, clockwise: true)
            layer.strokeColor = color.cgColor
            layer.lineWidth = size.width / 2
            layer.fillColor = nil
        case .flower:
            let center = CGPoint(x: size.width / 2, y: size.height / 4)
            let radi = size.width / 4
            let cornerRadi: CGFloat = radi / 2.5
            let rn = radi * 0.95 - cornerRadi
            var angle: CGFloat = 163

            for i in 1 ... 5 {
                let cc = CGPoint(x: center.x + rn * cos(angle * .pi / 180),
                                 y: center.y + rn * sin(angle * .pi / 180))
                
                let point = CGPoint(x: cc.x + cornerRadi * cos((angle - 72) * .pi / 180),
                                    y: cc.y + cornerRadi * sin((angle - 72) * .pi / 180))

                i == 1 ? path.move(to: point) : path.addLine(to: point)

                path.addArc(withCenter: cc,
                            radius: cornerRadi,
                            startAngle: (angle - 72) * .pi / 180,
                            endAngle: (angle + 72) * .pi / 180,
                            clockwise: true)
                
                angle += 144
            }
            path.move(to: CGPoint(x: size.width / 2, y: size.height / 2.5))
            path.addLine(to: CGPoint(x: size.width / 2, y: size.height))
            layer.strokeColor = color.cgColor
            layer.lineWidth = radi / 10
            layer.fillColor = color.cgColor
            path.close()
        case .mask:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            layer.path = path.cgPath
        case .waveMask:
            let Masksize = CGSize(width: size.width * 2, height: size.height)
            path.move(to: CGPoint(x: 0, y: Masksize.height / 2))
            path.addQuadCurve(to: CGPoint(x: Masksize.width * 0.25, y: Masksize.height * 0.5),
                              controlPoint: CGPoint(x: Masksize.width * 0.125, y: Masksize.height * 0.40))
            path.addQuadCurve(to: CGPoint(x: Masksize.width * 0.5, y: Masksize.height * 0.5),
                              controlPoint: CGPoint(x: Masksize.width * 0.33, y: Masksize.height * 0.60))
            path.addQuadCurve(to: CGPoint(x: Masksize.width * 0.75, y: Masksize.height * 0.5),
                              controlPoint: CGPoint(x: Masksize.width * 0.66, y: Masksize.height * 0.40))
            path.addQuadCurve(to: CGPoint(x: Masksize.width, y: Masksize.height * 0.5),
                              controlPoint: CGPoint(x: Masksize.width * 0.85, y: Masksize.height * 0.60))
            path.addLine(to: CGPoint(x: Masksize.width, y: Masksize.height))
            path.addLine(to: CGPoint(x: 0, y: Masksize.height))
            layer.opacity = 0.9
        case .ship:
            path.move(to: CGPoint(x: size.width * 0.5, y: size.height * 0.05))
            path.addLine(to: CGPoint(x: size.width * 0.30, y: size.height * 0.05))
            path.addLine(to: CGPoint(x: size.width * 0.30, y: size.height * 0.20))
            path.addLine(to: CGPoint(x: size.width * 0.5, y: size.height * 0.20))
            path.addLine(to: CGPoint(x: size.width * 0.5, y: size.height * 0.50))
            path.addLine(to: CGPoint(x: size.width / 50, y: size.height * 0.5))
            path.addArc(withCenter: CGPoint(x: size.width * 0.5, y: size.height * 0.25),
                        radius: size.width * 0.55,
                        startAngle: 5 * CGFloat.pi / 6,
                        endAngle: CGFloat.pi / 6,
                        clockwise: false)
            path.addLine(to: CGPoint(x: size.width - size.width / 50, y: size.height * 0.5))
            path.addLine(to: CGPoint(x: size.width * 0.5, y: size.height * 0.5))
            path.addLine(to: CGPoint(x: size.width * 0.5, y: 0))
            layer.lineWidth = size.height / 40
            layer.lineCap = .round
            layer.strokeColor = color.cgColor
            layer.fillColor = color.cgColor
        }
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return layer
    }
}


