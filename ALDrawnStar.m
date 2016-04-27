//
//  ALDrawnStar.m
//  DrawingTest
//
//  Created by Alex on 26.04.16.
//  Copyright © 2016 Liman Inc. All rights reserved.
//

#import "ALDrawnStar.h"

@implementation ALDrawnStar{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

- (void)drawRect:(CGRect)rect {
    NSLog(@"%@", NSStringFromCGRect(rect));
    
    for (int i = 0; i < 5; i++) {
        CGRect tmpRect = CGRectMake(100,
                                    100,
                                    CGRectGetWidth(rect),
                                    CGRectGetHeight(rect));
        
        CGPoint randomPoint = CGPointMake(CGRectGetWidth(tmpRect) - arc4random() % ((int)CGRectGetWidth(tmpRect) + 1),
                                          CGRectGetHeight(tmpRect) - arc4random() % ((int)CGRectGetHeight(tmpRect) + 1));
        
        [self drawStar:randomPoint color:[self randomColor]];
    }
    
}

- (UIColor *)randomColor {
    
    CGFloat r = (float)(arc4random() % 256) / 255;
    CGFloat g = (float)(arc4random() % 256) / 255;
    CGFloat b = (float)(arc4random() % 256) / 255;
    
    return [[UIColor alloc] initWithRed:r green:g blue:b alpha:1.f];
}

- (void)drawStar:(CGPoint)centerStar color:(UIColor *)color {
    int aSize = 100.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, aSize);
    CGFloat xCenter = centerStar.x;
    CGFloat yCenter = centerStar.y;
    
    float  w = 200.0;
    double r = w / 2.0 ;
    float flip = -1.0;
    double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
    
    //draw a star
    for (NSUInteger k=1; k<5; k++)
    {
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    
    CGContextFillPath(context);
    
    //draw circles
    CGContextSetFillColorWithColor(context, color.CGColor);
    for (NSUInteger k=1; k<6; k++)
    {
        
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        CGContextFillEllipseInRect(context, CGRectMake(x+xCenter - 25, y*flip+yCenter - 25, 50, 50));
        
    }
    
    CGContextFillPath(context);
    
    
    //draw line
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    
    
    r = w / 2.0 + 25;
    for (NSUInteger k=1; k<6; k++)
    {
        
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        CGContextSetLineWidth(context, 5.f);
        CGContextMoveToPoint(context, x+xCenter, y*flip+yCenter);
        CGContextSetLineCap(context, kCGLineCapRound);
        x = r * sin((k + 2) * theta);
        y = r * cos((k + 2) * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    
    CGContextClosePath(context);
    CGContextStrokePath(context);
}



@end
