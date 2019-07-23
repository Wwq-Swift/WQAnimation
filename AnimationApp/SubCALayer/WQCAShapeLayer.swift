//
//  WQCAShapeLayer.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/23.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit

/*
 CAShapeLayer是一个通过矢量图形而不是bitmap来绘制的图层子类。你指定诸如颜色和线宽等属性，用CGPath来定义想要绘制的图形，最后CAShapeLayer就自动渲染出来了。当然，你也可以用Core Graphics直接向原始的CALyer的内容中绘制一个路径，相比直下，使用CAShapeLayer有以下一些优点：
 
 一：渲染快速。CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多。
 二：高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
 三：不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被剪裁掉（如我们在第二章所见）。
 四：不会出现像素化。当你给CAShapeLayer做3D变换时，它不像一个有寄宿图的普通图层一样变得像素化。
 
 CAShapeLayer可以用来绘制所有能够通过CGPath来表示的形状。这个形状不一定要闭合，图层路径也不一定要不可破，事实上你可以在一个图层上绘制好几个不同的形状。你可以控制一些属性比如lineWith（线宽，用点表示单位），lineCap（线条结尾的样子），和lineJoin（线条之间的结合点的样子）；但是在图层层面你只有一次机会设置这些属性。如果你想用不同颜色或风格来绘制多个形状，就不得不为每个形状准备一个图层了。
 */
/// 采用cashapelayer 做火材人
func useCAShapeLayer(view: UIView) {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 175, y: 100))
    path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 25, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
    path.move(to: CGPoint(x: 150, y: 125))
    path.addLine(to: CGPoint(x: 150, y: 175))
    path.addLine(to: CGPoint(x: 125, y: 225))
    path.move(to: CGPoint(x: 150, y: 175))
    path.addLine(to: CGPoint(x: 175, y: 225))
    path.move(to: CGPoint(x: 100, y: 150))
    path.addLine(to: CGPoint(x: 200, y: 150))
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.strokeColor = UIColor.red.cgColor
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.lineWidth = 5
    shapeLayer.lineJoin = .round
    shapeLayer.lineCap = .round
    shapeLayer.path = path.cgPath
    
    view.layer.addSublayer(shapeLayer)
}

