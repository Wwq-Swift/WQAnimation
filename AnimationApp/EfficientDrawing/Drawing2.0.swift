//
//  Drawing2.0.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/25.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit

/*
 Core Animation为这些图形类型的绘制提供了专门的类，并给他们提供硬件支持。CAShapeLayer可以绘制多边形，直线和曲线。CATextLayer可以绘制文本。CAGradientLayer用来绘制渐变。这些总体上都比Core Graphics更快，同时他们也避免了创造一个寄宿图。
 
 将Drawing1.0的代码变动一下，用CAShapeLayer替代Core Graphics，性能就会得到提高.
 虽然随着路径复杂性的增加，绘制性能依然会下降，但是只有当非常非常浮躁的绘制时才会感到明显的帧率差异。
 */
class DrawingTwo: UIView {

    let path = UIBezierPath()
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let shapeLayer = layer as? CAShapeLayer else { return }
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else {
            return
        }
        path.move(to: point)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self), let shapeLayer = layer as? CAShapeLayer else {
            return
        }
        path.addLine(to: point)
        /// 更新shapelayer 的path
        shapeLayer.path = path.cgPath
    }
}
