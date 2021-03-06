//
//  WQCATransformLayer.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/24.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit

/*
 当我们在构造复杂的3D事物的时候，如果能够组织独立元素就太方便了。比如说，你想创造一个孩子的手臂：你就需要确定哪一部分是孩子的手腕，哪一部分是孩子的前臂，哪一部分是孩子的肘，哪一部分是孩子的上臂，哪一部分是孩子的肩膀等等。
 当然是允许独立地移动每个区域的啦。以肘为指点会移动前臂和手，而不是肩膀。Core Animation图层很容易就可以让你在2D环境下做出这样的层级体系下的变换，但是3D情况下就不太可能，因为所有的图层都把他的孩子都平面化到一个场景中。
 
 CATransformLayer解决了这个问题，CATransformLayer不同于普通的CALayer，因为它不能显示它自己的内容,只有当存在了一个能作用域子图层的变换它才真正存在。CATransformLayer并不平面化它的子图层，所以它能够用于构造一个层级的3D结构，比如我的手臂示例。
 
 立方体例子
 不采用CATransformLayer:
 我们将通过旋转camara来解决图层平面化问题而不是像立方体示例代码中用的sublayerTransform。这是一个非常不错的技巧，但是只能作用域单个对象上，如果你的场景包含两个立方体，那我们就不能用这个技巧单独旋转他们了。
 
 采用CATransformLayer:
 
 基本逻辑放置立方体：
 我们将他们放置到一个CATransformLayer中创建一个独立的立方体对象，然后将两个这样的立方体放进容器中。我们随机地给立方面染色以将他们区分开来，这样就不用靠标签或是光亮来区分他们。
 */
private func useCATransformLayer(in view: UIView) {
    
    /// 转换方向 (并取随机色)
    func faceWithTransform(transform: CATransform3D) -> CALayer {
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        
        let red = CGFloat(arc4random() % 255)
        let green = CGFloat(arc4random() % 255)
        let blue = CGFloat(arc4random() % 255)
        
        face.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1).cgColor
        
        face.transform = transform
        return face
    }
    
    func cubeWithTransform(transform: CATransform3D) -> CALayer {
        //  代表一个cube
        let cube = CATransformLayer()
        
        /// face One
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        //add cube face Two
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat.pi/2, 0, 1, 0);
        cube.addSublayer(faceWithTransform(transform: ct))
        
        //add cube face 3
        ct = CATransform3DMakeTranslation(0, -50, 0);
        ct = CATransform3DRotate(ct, CGFloat.pi/2, 1, 0, 0);
        cube.addSublayer(faceWithTransform(transform: ct))
        
        //add cube face 4
        ct = CATransform3DMakeTranslation(0, 50, 0);
        ct = CATransform3DRotate(ct, -CGFloat.pi/2, 1, 0, 0);
        cube.addSublayer(faceWithTransform(transform: ct))
        
        //add cube face 5
        ct = CATransform3DMakeTranslation(-50, 0, 0);
        ct = CATransform3DRotate(ct, -CGFloat.pi/2, 0, 1, 0);
        cube.addSublayer(faceWithTransform(transform: ct))
        
        //add cube face 6
        ct = CATransform3DMakeTranslation(0, 0, -50);
        ct = CATransform3DRotate(ct, CGFloat.pi, 0, 1, 0);
        cube.addSublayer(faceWithTransform(transform: ct))
        
        //放在中心位置
        let containerSize = view.bounds.size
        cube.position = CGPoint(x: containerSize.width / 2.0, y: containerSize.height / 2.0)
        
        cube.transform = transform
        return cube;
    }
    
    /// 设置默认container layer (用于转换 视角)
    var pt = CATransform3DIdentity
    pt.m34 = -1.0 / 500.0
    view.layer.sublayerTransform = pt
    
    //放置第一个cube
    var c1t = CATransform3DIdentity
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    let cube1 = cubeWithTransform(transform: c1t)
    view.layer.addSublayer(cube1)
    
    //放置第二个cube
    var c2t = CATransform3DIdentity
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -CGFloat.pi/4, 1, 0, 0)
    c2t = CATransform3DRotate(c2t, -CGFloat.pi/4, 0, 1, 0)
    let cube2 =  cubeWithTransform(transform: c2t)
    view.layer.addSublayer(cube2)
}
