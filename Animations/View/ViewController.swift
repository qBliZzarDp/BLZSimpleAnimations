//
//  ViewController.swift
//  Animations
//
//  Created by Алексей Филатов on 21.01.2022.
//

import UIKit

class ViewController: UIViewController {

    let centerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        crateAnimationsDemoView()
//        justOne()
    }

    func crateAnimationsDemoView() {
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)

        let squares = AnimationContainerView(frame: CGRect(x: view.center.x - 60, y: view.center.y - 60, width: 120, height: 120),
                                             backgroundColor: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
        squares.addAnimation(animation: .fourSquares, color: .systemIndigo)
        view.addSubview(squares)

        let dropFall = AnimationContainerView(frame: CGRect(x: squares.frame.minX - 130, y: squares.frame.minY, width: 120, height: 120),
                                              backgroundColor: .systemPink)
        dropFall.addAnimation(animation: .dropFall, color: .cyan)
        view.addSubview(dropFall)

        let flower = AnimationContainerView(frame: CGRect(x: squares.frame.minX + 130, y: squares.frame.minY, width: 120, height: 120),
                                            backgroundColor: .cyan)
        flower.addAnimation(animation: .flower, color: .systemPink)
        view.addSubview(flower)

        let load = AnimationContainerView(frame: CGRect(x: squares.frame.minX, y: squares.frame.minY + 130, width: 120, height: 120),
                                          backgroundColor: .black)
        load.addAnimation(animation: .load, color: .orange)
        view.addSubview(load)

        let ship = AnimationContainerView(frame: CGRect(x: squares.frame.minX, y: squares.frame.minY - 130, width: 120, height: 120),
                                          backgroundColor: .systemTeal)
        ship.addAnimation(animation: .ship, color: .systemGray4)
        view.addSubview(ship)

        dropFall.layer.cornerRadius = dropFall.bounds.size.width / 2
        flower.layer.cornerRadius = flower.bounds.size.width / 2
        load.layer.cornerRadius = load.bounds.size.width / 2
        ship.layer.cornerRadius = ship.bounds.size.width / 2
        dropFall.layer.masksToBounds = true
        squares.layer.masksToBounds = true
        flower.layer.masksToBounds = true
        load.layer.masksToBounds = true
        ship.layer.masksToBounds = true
    }
    
    func justOne() {
        let ship = AnimationContainerView(frame: CGRect(x: view.center.x - 150, y: view.center.y - 150, width: 300, height: 300),
                                          backgroundColor: .systemTeal)
        ship.addAnimation(animation: .ship, color: .systemGray4)
        view.addSubview(ship)
        ship.layer.cornerRadius = ship.bounds.size.width / 2
        ship.layer.masksToBounds = true
    }
}

