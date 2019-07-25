//
//  CommonUtil.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/25.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit

/// 创建随机色
func buildRandomColor() -> UIColor {
    let red = CGFloat(arc4random() % 255)
    let green = CGFloat(arc4random() % 255)
    let blue = CGFloat(arc4random() % 255)
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
}
