//
//  LDCoreTextTool.m
//  iLifeDiary
//
//  Created by Visac MBP on 2017/8/9.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import "VscCoreTextTool.h"

@interface VscCoreTextTool (){
    BOOL isBold;
    BOOL isItalic;
    BOOL isUnderline;
    BOOL isBigger;
    BOOL isAddedLink;
    UIColor *color;
    
    UIImage *bold_norImg;
    UIImage *bold_selImg;
    UIImage *italic_norImg;
    UIImage *italic_selImg;
    UIImage *bigger_norImg;
    UIImage *bigger_selImg;
    UIImage *addLink_norImg;
    UIImage *addLink_selImg;
    UIColor *norColor;
    UIColor *selColor;
}
@property (nonatomic,strong) UIBarButtonItem *allChooseItem;
@property (nonatomic,strong) UIBarButtonItem *boldItem;
@property (nonatomic,strong) UIBarButtonItem *italicItem;
@property (nonatomic,strong) UIBarButtonItem *underlineItem;
@property (nonatomic,strong) UIBarButtonItem *biggerItem;
@property (nonatomic,strong) UIBarButtonItem *colorItem;
@property (nonatomic,strong) UIBarButtonItem *flexibleItem;
@property (nonatomic,strong) UIBarButtonItem *addLinkItem;

@property (nonatomic,strong) NSMutableArray *itemsArray;
@property (nonatomic,strong) NSBundle *bundle;
@end

@implementation VscCoreTextTool
-(void)initImages{
    bold_norImg = [UIImage imageNamed:@"images/文字编辑.加粗.无" inBundle:self.bundle compatibleWithTraitCollection:nil];
    bold_selImg = [UIImage imageNamed:@"images/文字编辑.加粗.点亮" inBundle:self.bundle compatibleWithTraitCollection:nil];
    italic_norImg = [UIImage imageNamed:@"images/文字编辑.斜体.无" inBundle:self.bundle compatibleWithTraitCollection:nil];
    italic_selImg = [UIImage imageNamed:@"images/文字编辑.斜体.点亮" inBundle:self.bundle compatibleWithTraitCollection:nil];
    bigger_norImg = [UIImage imageNamed:@"images/文字编辑.字号.无" inBundle:self.bundle compatibleWithTraitCollection:nil];
    bigger_selImg = [UIImage imageNamed:@"images/文字编辑.字号.点亮" inBundle:self.bundle compatibleWithTraitCollection:nil];
    addLink_norImg = [UIImage imageNamed:@"images/文字编辑.链接.无" inBundle:self.bundle compatibleWithTraitCollection:nil];
    addLink_selImg = [UIImage imageNamed:@"images/文字编辑.链接.点亮" inBundle:self.bundle compatibleWithTraitCollection:nil];
    
    norColor = [UIColor colorWithRed:166.f/255.f green:166.f/255.f blue:166.f/255.f alpha:1];
    selColor = [UIColor colorWithRed:64.f/255.f green:192.f/255.f blue:172.f/255.f alpha:1];
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initImages];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(NSBundle *)bundle{
    if (!_bundle) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"CTV" ofType:@".bundle"];
        _bundle = [NSBundle bundleWithPath:path];
    }
    return _bundle;
}
-(UIButton *)quickCreateButtonWithNorImage:(UIImage *)norImg selImage:(UIImage *)selImg{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 43, 31)];
    [button setImage:norImg forState:UIControlStateNormal];
    [button setImage:selImg forState:UIControlStateHighlighted];
    [button setImage:selImg forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:64];
    return button;
}
-(UIButton *)quickCreateButtonTitle:(NSString *)title{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 43, 31)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:norColor forState:UIControlStateNormal];
    [button setTitleColor:selColor forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:64];
    return button;
}
-(UIBarButtonItem *)allChooseItem{
    if (!_allChooseItem) {
        UIButton *tempButton = [self quickCreateButtonTitle:self.allChooseStr];
        CGSize size = [self.allChooseStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 17) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17.f]} context:NULL].size;
        tempButton.titleLabel.font = [UIFont systemFontOfSize:17];
        tempButton.frame = CGRectMake(0, 0, size.width, 17);
        tempButton.tag = ClickAll;
        _allChooseItem = [[UIBarButtonItem alloc] initWithCustomView:tempButton];
    }
    return _allChooseItem;
}
-(UIBarButtonItem *)boldItem{
    if (!_boldItem) {
        UIButton *tempButton = [self quickCreateButtonWithNorImage:bold_norImg selImage:bold_selImg];
        tempButton.tag = ClickBold;
        _boldItem = [[UIBarButtonItem alloc] initWithCustomView:tempButton];
    }
    return _boldItem;
}
-(UIBarButtonItem *)italicItem{
    if (!_italicItem) {
        UIButton *tempButton = [self quickCreateButtonWithNorImage:italic_norImg selImage:italic_selImg];
        tempButton.tag = ClickItalic;
        _italicItem = [[UIBarButtonItem alloc] initWithCustomView:tempButton];
    }
    return _italicItem;
}
-(UIBarButtonItem *)underlineItem{
    if (!_underlineItem) {
        UIButton *tempButton = [self quickCreateButtonWithNorImage:nil selImage:nil];
        tempButton.tag = ClickUnderline;
        _underlineItem = [[UIBarButtonItem alloc] initWithCustomView:tempButton];
    }
    return _underlineItem;
}
-(UIBarButtonItem *)biggerItem{
    if (!_biggerItem) {
        UIButton *tempButton = [self quickCreateButtonWithNorImage:bigger_norImg selImage:bigger_selImg];
        tempButton.tag = ClickBigger;
        _biggerItem = [[UIBarButtonItem alloc] initWithCustomView:tempButton];
    }
    return _biggerItem;
}
-(UIBarButtonItem *)colorItem{
    if (!_colorItem) {
        UIButton *tempButton = [self quickCreateButtonWithNorImage:nil selImage:nil];
        tempButton.tag = ClickColor;
        _colorItem = [[UIBarButtonItem alloc] initWithCustomView:tempButton];
    }
    return _colorItem;
}
-(UIBarButtonItem *)flexibleItem{
    if (!_flexibleItem) {
        _flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    }
    return _flexibleItem;
}
-(UIBarButtonItem *)addLinkItem{
    if (!_addLinkItem) {
        UIButton *tempButton = [self quickCreateButtonWithNorImage:addLink_norImg selImage:addLink_selImg];
        [tempButton setTitle:self.addLinkStr forState:UIControlStateNormal];
        CGSize size = [self.addLinkStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 17) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17.f]} context:NULL].size;
        tempButton.titleLabel.font = [UIFont systemFontOfSize:17];
        tempButton.frame = CGRectMake(0, 0, size.width + 30, 17);
        
        [tempButton setTitleColor:norColor forState:UIControlStateNormal];
        [tempButton setTitleColor:selColor forState:UIControlStateHighlighted];
        [tempButton setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
        
        tempButton.tag = ClickAddLink;
        _addLinkItem = [[UIBarButtonItem alloc] initWithCustomView:tempButton];
    }
    return _addLinkItem;
}
-(NSMutableArray *)itemsArray{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}
-(void)buttonClick:(UIButton *)item{
    if (!self.didClick) {
        return;
    }
    switch (item.tag) {
        case ClickAll:{
            self.didClick((ClickType)item.tag,YES,nil);
        }
            break;
        case ClickBold:{
            isBold = !isBold;
            item.selected = isBold;
            self.didClick((ClickType)item.tag,isBold,nil);
        }
            break;
        case ClickItalic:{
            isItalic = !isItalic;
            item.selected = isItalic;
            self.didClick((ClickType)item.tag,isItalic,nil);
        }
            break;
        case ClickUnderline:{
            isUnderline = !isUnderline;
            item.selected = isUnderline;
            self.didClick((ClickType)item.tag, isUnderline, nil);
        }
            break;
        case ClickBigger:{
            isBigger = !isBigger;
            item.selected = isBigger;
            self.didClick((ClickType)item.tag,isBigger,nil);
        }
            break;
        case ClickColor:{
            self.didClick((ClickType)item.tag,YES,color);
        }
            break;
        case ClickAddLink:{
            self.didClick((ClickType)item.tag,YES,nil);
        }
            break;
    }
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self.itemsArray addObject:self.allChooseItem];
    [self.itemsArray addObject:self.boldItem];
    [self.itemsArray addObject:self.biggerItem];
    [self.itemsArray addObject:self.flexibleItem];
    [self.itemsArray addObject:self.addLinkItem];
    self.items = self.itemsArray.copy;
}
@end
