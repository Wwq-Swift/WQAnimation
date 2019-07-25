//
//  Drawing3.0.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/25.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit
/*
 脏矩形
 有时候用CAShapeLayer或者其他矢量图形图层替代Core Graphics并不是那么切实可行。比如我们的绘图应用：我们用线条完美地完成了矢量绘制。但是设想一下如果我们能进一步提高应用的性能，让它就像一个黑板一样工作，然后用『粉笔』来绘制线条。模拟粉笔最简单的方法就是用一个『线刷』图片然后将它粘贴到用户手指碰触的地方，但是这个方法用CAShapeLayer没办法实现。
 我们可以给每个『线刷』创建一个独立的图层，但是实现起来有很大的问题。屏幕上允许同时出现图层上线数量大约是几百，那样我们很快就会超出的。这种情况下我们没什么办法，就用Core Graphics吧（除非你想用OpenGL做一些更复杂的事情）。
 我们的『黑板』应用的最初实现见Drawing1.0，我们更改了之前版本的DrawingView，用一个画刷位置的数组代替UIBezierPath
 */
class DrawingThree: UIView {
    
    var strokes: [CGPoint] = []
    /// 每个刷点的大小
    let brushSize = CGSize(width: 5, height: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else {
            return
        }
        addBrushStroke(at: point)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else {
            return
        }
        addBrushStroke(at: point)
    }
    
    /// i添加每一个刷点
    func addBrushStroke(at point: CGPoint) {
        strokes.append(point)
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        /// 绘制我每一个点
        for point in strokes {
            let brushRext = CGRect(x: point.x - brushSize.width/2, y: point.y - brushSize.height/2, width: brushSize.width, height: brushSize.height)
            UIImage(named: "rain")!.draw(in: brushRext)
        }
    }
}
