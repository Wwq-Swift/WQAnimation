//
//  VectorGraphics.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/25.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit

/// 画图软件1.0
/*
 展示了一个基本的画线应用。这个应用将用户的触摸手势转换成一个UIBezierPath上的点，然后绘制成视图。我们在一个UIView子类DrawingView中实现了所有的绘制逻辑，这个情况下我们没有用上view controller。但是如果你喜欢你可以在view controller中实现触摸事件处理。
 
 直接在CPU进行计算处理
 
 这样实现的问题在于，我们画得越多，程序就会越慢。因为每次移动手指的时候都会重绘整个贝塞尔路径（UIBezierPath），随着路径越来越复杂，每次重绘的工作就会增加，直接导致了帧数的下降。看来我们需要一个更好的方法了。
 */
class DrawingOne: UIView {
    
    let path: UIBezierPath = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /// 配置path
        path.lineJoinStyle = .round
        path.lineCapStyle = .round
        path.lineWidth = 5
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
        guard let point = touches.first?.location(in: self) else {
            return
        }
        path.addLine(to: point)
        /// 实时绘制
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.clear.setFill()
        UIColor.blue.setStroke()
        path.stroke()
    }
}
