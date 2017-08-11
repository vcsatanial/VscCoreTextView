//
//  VscAttributes.m
//  VscCoreTextViewDemo
//
//  Created by Visac MBP on 2017/8/10.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import "VscAttributes.h"
const NSString *disText = @"TEXT";
const NSString *disBold = @"BOLD";
const NSString *disBigger = @"BIGGER";
@implementation VscAttributes
-(NSString *)text{
    return self[disText];
}
-(void)setText:(NSString *)text{
    self[disText] = text;
}
-(BOOL)isBold{
    return [self[disBold] isEqualToString:@"1"];
}
-(void)setIsBold:(BOOL)isBold{
    self[disBold] = isBold ? @"1" : @"0";
}
-(BOOL)isBigger{
    return [self[disBigger] isEqualToString:@"1"];
}
-(void)setIsBigger:(BOOL)isBigger{
    self[disBigger] = isBigger ? @"1" : @"0";
}
-(BOOL)isSameStyle:(VscAttributes *)other{
    if (self.isBold == other.isBold && self.isBigger == other.isBigger) {
        return YES;
    }else{
        return NO;
    }
}
@end
