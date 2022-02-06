//
//  Animations.swift
//  Animations
//
//  Created by Алексей Филатов on 05.02.2022.
//

import UIKit

enum Animations {
    case dropFall
    case fourSquares
    case flower
    case load
    case ship

    func animateCases() -> BLZAnimationProtocol {
        switch self {
        case .dropFall:
            return BLZDropFall()
        case .load:
            return BLZLoad()
        case .fourSquares:
            return BLZSquares()
        case .flower:
            return BLZFlower()
        case .ship:
            return BLZShip()
        }
    }
}
