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

typedef enum{
    ButtonAll = 1,
    ButtonBold = 1 << 1,
    ButtonItalic = 1 << 2,
    ButtonUnderline = 1 << 3,
    ButtonBigger = 1 << 4,
    ButtonColor = 1 << 5,
    ButtonAddLink = 1 << 6,
}addButtonType;


typedef void(^ClickBlock)(ClickType type,BOOL isChosen,id others);
@interface VscCoreTextTool : UIToolbar
@property (nonatomic,copy) NSString *allChooseStr;
@property (nonatomic,copy) NSString *addLinkStr;
@property (nonatomic,copy) ClickBlock didClick;
@property (nonatomic,copy) NSArray <UIColor *>*colors;//1.0暂不实现
@property (nonatomic,assign) addButtonType addTypes;
-(void)clearType;
@end
