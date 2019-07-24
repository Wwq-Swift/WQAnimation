//
//  WQCAGradientLayer.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/24.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit


/*
 CAGradientLayer是用来生成两种或更多颜色平滑渐变的。用Core Graphics复制一个CAGradientLayer并将内容绘制到一个普通图层的寄宿图也是有可能的，但是CAGradientLayer的真正好处在于绘制使用了硬件加速。
 */
private func useCAGradientLayer(in view: UIView) {
    //创建一个渐变涂层并添加到view
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = CGRect(x: 20, y: 60, width: 200, height: 200)
    view.layer.addSublayer(gradientLayer)
    
    //设置颜色
    gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
    
    //设置开始节点与结束节点
    gradientLayer.startPoint = CGPoint.zero
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    
    
    /// 多重渐变色
    let gradientLayerT = CAGradientLayer()
    gradientLayerT.frame = CGRect(x: 20, y: 350, width: 200, height: 200)
    view.layer.addSublayer(gradientLayerT)
    
    gradientLayerT.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor]
    
    /// 用于控制范围的 m要与 colors 数量对应
    gradientLayerT.locations = [0.0, 0.25, 0.5]
    
    gradientLayerT.startPoint = CGPoint.zero
    gradientLayerT.endPoint = CGPoint(x: 1, y: 1)
}
