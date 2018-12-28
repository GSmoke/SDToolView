//
//  UIButton+Region.h
//  SDToolView
//
//  Created by apple on 2018/12/27.
//  Copyright © 2018年 apple. All rights reserved.
//
// Thanks wg689 https://www.jianshu.com/p/ce2d3191224f
// Thanks ys简单0 https://www.jianshu.com/p/4015c43d9942

#import <UIKit/UIKit.h>

@interface UIButton (Region)
/**
 * 扩大按钮热响应区域 size 四边扩大的数值
 * [defaultBtn setEnlargeEdge:10];  效果是点击按钮四周10像素之内都可以响应点击的方法
 */
- (void)sd_setEnlargeEdge:(CGFloat)size;

/**
 * 扩大按钮热响应区域 各个边扩大的数值
 * 同上四个边 分别设值
 */
- (void)sd_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat) bottom left:(CGFloat)left;
@end
