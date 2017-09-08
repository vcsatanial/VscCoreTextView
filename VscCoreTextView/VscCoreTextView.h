//
//  LDCoreTextView.h
//  iLifeDiary
//
//  Created by Visac MBP on 2017/8/7.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VscCoreTextTool.h"

typedef void(^addLink)();
typedef void(^overMaxCount)();

@interface VscCoreTextView : UITextView
@property (nonatomic,assign) BOOL useCoreTextTool;
@property (nonatomic,copy) NSString *allChooseStr;
@property (nonatomic,copy) NSString *addLinkStr;
@property (nonatomic,copy) NSString *maxCountStr;
@property (nonatomic,copy) addLink didClickAddLink;
@property (nonatomic,copy) overMaxCount overMax;
@property (nonatomic,assign) NSUInteger maxCount;
@property (nonatomic,assign) addButtonType addTypes;
@end
