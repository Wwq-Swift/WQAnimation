//
//  WQCATextLayer.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/24.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit

/*
 
 Core Animation提供了一个CALayer的子类CATextLayer，它以图层的形式包含了UILabel几乎所有的绘制特性，并且额外提供了一些新的特性。
 
 CATextLayer也要比UILabel渲染得快得多, 内部使用core text
 */
private func useCATextLayer(in view: UIView) {
    
    let textLayer = CATextLayer()
    textLayer.frame = CGRect(x: 0, y: 200, width: view.bounds.width, height: view.bounds.height)
    view.layer.addSublayer(textLayer)
    
    textLayer.foregroundColor = UIColor.blue.cgColor
    textLayer.alignmentMode = .justified
    textLayer.isWrapped = true
    
    let font = UIFont.systemFont(ofSize: 15)
    let fontName = font.fontName as CFString
    let fontR = CGFont(fontName)
    textLayer.fontSize = font.pointSize
    textLayer.font = fontR
    
    /// 去除像素化
    textLayer.contentsScale = UIScreen.main.scale
    
    let text = """
Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar  leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel  fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet  lobortis
"""
    textLayer.string = text
}
