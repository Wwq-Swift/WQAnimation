//
//  WQCAReplicatorLayer.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/23.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit

/*
 CAReplicatorLayer
 CAReplicatorLayer的目的是为了高效生成许多相似的图层。它会绘制一个或多个图层的子图层，并在每个复制体上应用不同的变换。
 
 注意到当图层在重复的时候，他们的颜色也在变化：这是用instanceBlueOffset和instanceGreenOffset属性实现的。通过逐步减少蓝色和绿色通道，我们逐渐将图层颜色转换成了红色。这个复制效果看起来很酷，但是CAReplicatorLayer真正应用到实际程序上的场景比如：一个游戏中导弹的轨迹云，或者粒子爆炸。除此之外，还有一个实际应用是：反射
 */

func useCAReplicatorLayer(view: UIView) {
    view.backgroundColor = UIColor.yellow
    //创建 useCAReplicatorLayer
    let replicator = CAReplicatorLayer()
    replicator.frame = CGRect(x: 0, y: -200, width: view.bounds.width, height: 400)
    view.layer.addSublayer(replicator)

    //重复次数
    replicator.instanceCount = 10;
    //apply a transform for each instance
    var transform = CATransform3DIdentity
    transform = CATransform3DRotate(transform, CGFloat.pi/5.0, 0, 0, 1)
    /// 控制布局方式
    replicator.instanceTransform = transform

    /// 给每个复制的实例上色
    replicator.instanceBlueOffset = -0.1
    replicator.instanceGreenOffset = -0.1

    /// 创建sublayer
    let layer = CALayer()
    layer.frame = CGRect(x: 10, y: 350, width: 50, height: 50)
    layer.backgroundColor = UIColor.blue.cgColor
    replicator.addSublayer(layer)
    
    
    /// 制作反射效果
    let rLayer = CAReplicatorLayer()
    rLayer.backgroundColor = UIColor.red.cgColor
    rLayer.instanceCount = 2
    rLayer.frame = CGRect(x: 0, y: 300, width: view.bounds.width, height: view.bounds.height - 300)
    
    // 位置处理
    var rTransform = CATransform3DIdentity
//    let verticalOffset = view.bounds.size.height + 2;
    rTransform = CATransform3DTranslate(rTransform, 0, -45, 0)
    rTransform = CATransform3DScale(rTransform, 1, -1, 0)
    rLayer.instanceTransform = rTransform
    
    let subLayer = CALayer()
    subLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
    subLayer.backgroundColor = UIColor.lightGray.cgColor
    subLayer.contents = UIImage(named: "orage")?.cgImage
    rLayer.addSublayer(subLayer)
    
    //设置透明度偏移
    rLayer.instanceAlphaOffset = -0.6
    view.layer.addSublayer(rLayer)
}
