//
//  VscAttributes.h
//  VscCoreTextViewDemo
//
//  Created by Visac MBP on 2017/8/10.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VscAttributes : NSMutableDictionary
@property (nonatomic,copy) NSString *text;
@property (nonatomic,assign) BOOL isBold;
@property (nonatomic,assign) BOOL isBigger;
-(BOOL)isSameStyle:(VscAttributes *)other;
@end
