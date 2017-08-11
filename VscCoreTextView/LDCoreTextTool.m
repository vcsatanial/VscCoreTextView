//
//  LDCoreTextTool.m
//  iLifeDiary
//
//  Created by Visac MBP on 2017/8/9.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import "LDCoreTextTool.h"

@interface LDCoreTextTool (){
    BOOL isBold;
    BOOL isItalic;
    BOOL isUnderline;
    BOOL isBigger;
    BOOL isAddedLink;
    UIColor *color;
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
@end

@implementation LDCoreTextTool
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(UIBarButtonItem *)allChooseItem{
    if (!_allChooseItem) {
        _allChooseItem = [[UIBarButtonItem alloc] initWithTitle:@"全选" style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
        _allChooseItem.tag = ClickAll;
    }
    return _allChooseItem;
}
-(UIBarButtonItem *)boldItem{
    if (!_boldItem) {
        _boldItem = [[UIBarButtonItem alloc] initWithTitle:@"B" style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
        _boldItem.tag = ClickBold;
    }
    return _boldItem;
}
-(UIBarButtonItem *)italicItem{
    if (!_italicItem) {
        _italicItem = [[UIBarButtonItem alloc] initWithTitle:@"/" style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
        _italicItem.tag = ClickItalic;
    }
    return _italicItem;
}
-(UIBarButtonItem *)underlineItem{
    if (!_underlineItem) {
        _underlineItem = [[UIBarButtonItem alloc] initWithTitle:@"__" style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
        _underlineItem.tag = ClickUnderline;
    }
    return _underlineItem;
}
-(UIBarButtonItem *)biggerItem{
    if (!_biggerItem) {
        _biggerItem = [[UIBarButtonItem alloc] initWithTitle:@"Aa" style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
        _biggerItem.tag = ClickBigger;
    }
    return _biggerItem;
}
-(UIBarButtonItem *)colorItem{
    if (!_colorItem) {
        _colorItem = [[UIBarButtonItem alloc] initWithTitle:@"Color" style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
        _colorItem.tag = ClickColor;
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
        _addLinkItem = [[UIBarButtonItem alloc] initWithTitle:@"添加链接" style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
        _addLinkItem.tag = ClickAddLink;
    }
    return _addLinkItem;
}
-(NSMutableArray *)itemsArray{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}
-(void)barItemClick:(UIBarButtonItem *)item{
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
            self.didClick((ClickType)item.tag,isBold,nil);
        }
            break;
        case ClickItalic:{
            isItalic = !isItalic;
            self.didClick((ClickType)item.tag,isItalic,nil);
        }
            break;
        case ClickUnderline:{
            isUnderline = !isUnderline;
            self.didClick((ClickType)item.tag, isUnderline, nil);
        }
            break;
        case ClickBigger:{
            isBigger = !isBigger;
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
