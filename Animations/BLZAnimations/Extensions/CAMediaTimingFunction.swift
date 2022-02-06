//
//  CAMediaTimingFunction.swift
//  Animations
//
//  Created by Алексей Филатов on 25.01.2022.
//

import UIKit

public extension CAMediaTimingFunction {
    static let linear = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    static let easeIn = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
    static let easeOut = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    static let easeInEaseOut = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
}
