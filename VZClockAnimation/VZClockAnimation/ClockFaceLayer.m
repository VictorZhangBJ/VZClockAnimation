//
//  ClockFaceLayer.m
//  VZClockAnimation
//
//  Created by mini4s215 on 12/4/15.
//  Copyright © 2015 victor. All rights reserved.
//

#import "ClockFaceLayer.h"

@implementation ClockFaceLayer

//告诉编译器不做处理，编译通过，其getter和setter方法 在运行时动态创建，由KVC -KVO 管理
@dynamic time;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bounds = CGRectMake(0, 0, 200, 200);
    }
    return self;
}
+(BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"time"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

-(id<CAAction>)actionForKey:(NSString *)event
{
    if ([event isEqualToString:@"time"]) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"time"];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.fromValue = @([[self presentationLayer] time]);
        return animation;
    }
    return [super actionForKey:event];
}

-(void)drawInContext:(CGContextRef)ctx
{
    CGFloat time = [[self presentationLayer] time];
    NSLog(@"time = %f",time);
    
}


@end
