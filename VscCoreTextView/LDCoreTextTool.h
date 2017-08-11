//
//  LDCoreTextTool.h
//  iLifeDiary
//
//  Created by Visac MBP on 2017/8/9.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    ClickAll = 1000,
    ClickBold,
    ClickItalic,
    ClickUnderline,
    ClickBigger,
    ClickColor,
    ClickAddLink,
}ClickType;
typedef void(^ClickBlock)(ClickType type,BOOL isChosen,id others);
@interface LDCoreTextTool : UIToolbar
@property (nonatomic,copy) ClickBlock didClick;
@end
