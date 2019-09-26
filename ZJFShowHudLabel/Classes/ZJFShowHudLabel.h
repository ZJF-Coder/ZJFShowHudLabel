//
//  ShowHudLabel.h
//  yonbb
//
//  Created by sth on 2017/7/20.
//  Copyright © 2017年 Yonbb. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZJFShowHudLabel : UILabel

/**
 * 创建单例
 */
+ (ZJFShowHudLabel *)shareHud;

/**
 根据传入的showText显示成hud提示框
 */

- (void)showInfo:(NSString *)showText WithTopY:(CGFloat)topY OnDuration:(CGFloat)duration;

@end
