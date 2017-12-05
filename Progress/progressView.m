//
//  progressView.m
//  Progress
//
//  Created by hao on 2017/10/25.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "progressView.h"

@implementation progressView

-(void)setProgressValue:(CGFloat)progressValue{
    _progressValue = progressValue;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = -M_PI_2;
    CGFloat angle = self.progressValue * M_PI * 2;
    CGFloat endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

@end
