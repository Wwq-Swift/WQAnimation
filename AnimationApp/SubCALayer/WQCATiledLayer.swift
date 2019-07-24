//
//  WQCATiledLayer.swift
//  AnimationApp
//
//  Created by kris.wang on 2019/7/24.
//  Copyright © 2019年 kris.wang. All rights reserved.
//

import UIKit


/*
 
 CATiledLayer 用处： 解决一次性加载大图，我们采用按需加载，而不是一次性加载造成的性能问题，j
 
 有些时候你可能需要绘制一个很大的图片，常见的例子就是一个高像素的照片或者是地球表面的详细地图。iOS应用通畅运行在内存受限的设备上，所以读取整个图片到内存中是不明智的。载入大图可能会相当地慢，那些对你看上去比较方便的做法（在主线程调用UIImage的-imageNamed:方法或者-imageWithContentsOfFile:方法）将会阻塞你的用户界面，至少会引起动画卡顿现象。
 能高效绘制在iOS上的图片也有一个大小限制。所有显示在屏幕上的图片最终都会被转化为OpenGL纹理，同时OpenGL有一个最大的纹理尺寸（通常是2048*2048，或4096*4096，这个取决于设备型号）。如果你想在单个纹理中显示一个比这大的图，即便图片已经存在于内存中了，你仍然会遇到很大的性能问题，因为Core Animation强制用CPU处理图片而不是更快的GPU
 。
 
 CATiledLayer为载入大图造成的性能问题提供了一个解决方案：将大图分解成小片然后将他们单独按需载入。让我们用实验来证明一下。

 
 例子： 我们将会从一个2048*2048分辨率的雪人图片入手。为了能够从CATiledLayer中获益，我们需要把这个图片裁切成许多小一些的图片。你可以通过代码来完成这件事情，但是如果你在运行时读入整个图片并裁切，那CATiledLayer这些所有的性能优点就损失殆尽了。理想情况下来说，最好能够逐个步骤来实现
 */