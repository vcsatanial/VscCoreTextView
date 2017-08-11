//
//  LDCoreTextView.h
//  iLifeDiary
//
//  Created by Visac MBP on 2017/8/7.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDCoreTextData.h"
@class LDCoreTextTool;
@interface LDCoreTextView : UIView<UITextInput,UITextInputTraits>
@property (nonatomic,copy) NSArray *coreTextArray;
@property (nonatomic,strong) LDCoreTextData *data;
@property (nonatomic,assign) CGFloat fontSize;
@property (nonatomic,assign) CGFloat bigFontSize;
@property (nonatomic,assign) CGFloat lineSpace;
@property (nonatomic,strong) UIColor *textViewColor;
@property (nonatomic,strong) LDCoreTextTool *toolBar;

@property (nonatomic,copy) NSAttributedString *coreText;;
@end
