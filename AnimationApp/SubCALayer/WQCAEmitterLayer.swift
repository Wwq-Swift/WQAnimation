//
//  WQCAEmitterLayer.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/24.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit
/*
 在iOS 5中，苹果引入了一个新的CALayer子类叫做CAEmitterLayer。CAEmitterLayer是一个高性能的粒子引擎，被用来创建实时例子动画如：烟雾，火，雨等等这些效果。
 CAEmitterLayer看上去像是许多CAEmitterCell的容器，这些CAEmitierCell定义了一个例子效果。你将会为不同的例子效果定义一个或多个CAEmitterCell作为模版，同时CAEmitterLayer负责基于这些模版实例化一个粒子流。一个CAEmitterCell类似于一个CALayer：它有一个contents属性可以定义为一个CGImage，另外还有一些可设置属性控制着表现和行为。我们不会对这些属性逐一进行详细的描述，你们可以在CAEmitterCell类的头文件中找到。
    （采用了享元模式来处理）
 
 
    例子。我们将利用在一圆中发射不同速度和透明度的粒子创建一个火爆炸的效果。清单6.13包含了生成爆炸的代码。
 
 */

func useCAEmitterLayer(in view: UIView) {
    //创建 emitter layer
    let emitter = CAEmitterLayer()
    emitter.frame = view.bounds
    view.layer.addSublayer(emitter)

    //配置 emitter
    emitter.renderMode = .additive//渲染模式
    emitter.emitterPosition = CGPoint(x: emitter.frame.size.width / 2.0, y: emitter.frame.size.height / 2.0)/// 发射的位置

    //创建 emitter cell
    let cell = CAEmitterCell()
    cell.contents = UIImage(named: "rain")?.cgImage
    cell.birthRate = 150
    cell.lifetime = 5
    cell.color = UIColor(red: 1, green: 0.5, blue: 0.1, alpha: 1).cgColor
    cell.alphaSpeed = -0.4
    cell.velocity = 50
    cell.velocityRange = 50
    cell.emissionRange = CGFloat.pi * 2

    //添加cell
    emitter.emitterCells = [cell]
}
