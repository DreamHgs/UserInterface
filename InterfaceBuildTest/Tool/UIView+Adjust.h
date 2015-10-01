//
//  UIView+Adjust.h
//  HanShi
//
//  Created by 洪泽泓 on 15/8/10.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Adjust)

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)point;

- (CGSize)size;
- (void)setSize:(CGSize)size;

- (CGFloat)x;
- (void)setX:(CGFloat)x;

- (CGFloat)y;
- (void)setY:(CGFloat)y;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)tail;
- (void)setTail:(CGFloat)tail;

- (CGFloat)bottom;
- (void)setBottom:(CGFloat)bottom;

- (CGFloat)right;
- (void)setRight:(CGFloat)right;

- (CGFloat)cornerRadius;
- (void)setCornerRadius:(CGFloat)cornerRadius;
@end
