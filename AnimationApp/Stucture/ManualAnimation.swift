//
//  ManualAnimation.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/25.
//  Copyright © 2019年 kris.wang. All rights reserved.
//


/*
 一： 手动动画 （通过设置timeOffSet）
 
 timeOffset一个很有用的功能在于你可以它可以让你手动控制动画进程，通过设置speed为0，可以禁用动画的自动播放，然后来使用timeOffset来来回显示动画序列。这可以使得运用手势来手动控制动画变得很简单。
 举个简单的例子：还是之前关门的动画，修改代码来用手势控制动画。我们给视图添加一个UIPanGestureRecognizer，然后用timeOffset左右摇晃。
 
 二： 暂停快进动画。（通过设置 speed 来控制）
 */
import Foundation
