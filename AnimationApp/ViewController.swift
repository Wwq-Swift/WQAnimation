//
//  ViewController.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/23.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit
/// 每一个UIView都是寄宿在一个CALayer的示例上
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        useCAShapeLayer()
//        useCATextLayer()
//        useCATransformLayer()
//        useCAGradientLayer()
//        useCAReplicatorLayer(view: view)
//        useCAEmitterLayer(in: view)
//        view.addSubview(DrawingOne(frame: view.bounds))
//        view.addSubview(DrawingTwo(frame: view.bounds))
//        view.addSubview(DrawingThree(frame: view.bounds))
        view.addSubview(DrawingFour(frame: view.bounds))
    }
    
}

class CashapeLayerView: UIView {
    
}

