//
//  LDCoreTextView.m
//  iLifeDiary
//
//  Created by Visac MBP on 2017/8/7.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import "VscCoreTextView.h"
#import "VscCoreTextTool.h"
#import <CoreText/CoreText.h>

@interface VscCoreTextView ()<UITextViewDelegate>{
}
@property (nonatomic,strong) VscCoreTextTool *vsc_inputAccessoryView;
@property (nonatomic,assign) CGFloat curFontSize;
@property (nonatomic,strong) UIFont *curFont;
@property (nonatomic,assign) BOOL curIsBold;
@property (nonatomic,strong) UILabel *placeHolderLabel;
@end

@implementation VscCoreTextView
-(instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
        _curFontSize = 15;
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        _curFontSize = 15;
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self addSubview:self.placeHolderLabel];
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (self.useCoreTextTool) {
        self.vsc_inputAccessoryView = [[VscCoreTextTool alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
        self.vsc_inputAccessoryView.allChooseStr = _allChooseStr;
        self.vsc_inputAccessoryView.addLinkStr = _addLinkStr;
    }
}
-(UILabel *)placeHolderLabel{
    if (!_placeHolderLabel) {
        _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 4, self.frame.size.width - 32, 24)];
        _placeHolderLabel.text = self.maxCountStr;
        _placeHolderLabel.textColor = [UIColor colorWithRed:166.f/255.f green:166.f/255.f blue:166.f/255.f alpha:1];
    }
    return _placeHolderLabel;
}
-(NSString *)allChooseStr{
    if (!_allChooseStr) {
        _allChooseStr = @"全选";
    }
    return _allChooseStr;
}
-(NSString *)addLinkStr{
    if (!_addLinkStr) {
        _addLinkStr = @"添加链接";
    }
    return _addLinkStr;
}
-(void)setVsc_inputAccessoryView:(VscCoreTextTool *)vsc_inputAccessoryView{
    _vsc_inputAccessoryView = vsc_inputAccessoryView;
    self.inputAccessoryView = vsc_inputAccessoryView;
    vsc_inputAccessoryView.didClick = ^(ClickType type, BOOL isChosen, id others) {
        switch (type) {
            case ClickAll:
                self.selectedRange = NSMakeRange(0, self.text.length);
                break;
            case ClickBold:
                _curIsBold = isChosen;
                [self resetFont];
                break;
            case ClickBigger:
                _curFontSize = isChosen ? 20 : 15;
                [self resetFont];
                break;
            case ClickAddLink:
                if (self.didClickAddLink) {
                    self.didClickAddLink();
                }
                break;
            default:
                break;
        }
    };
}
-(void)resetFont{
    if (_curIsBold) {
        _curFont = [UIFont boldSystemFontOfSize:_curFontSize];
    }else{
        _curFont = [UIFont systemFontOfSize:_curFontSize];
    }
    if (self.selectedRange.length != 0) {
        NSAttributedString *att = [[NSAttributedString alloc] initWithString:[self.attributedText attributedSubstringFromRange:self.selectedRange].string attributes:[self attributes]];
        NSMutableAttributedString *attMu = self.attributedText.mutableCopy;
        [attMu replaceCharactersInRange:self.selectedRange withAttributedString:att];
        self.attributedText = attMu;
    }
}
-(NSMutableDictionary *)attributes{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];

    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)_curFont.fontName, _curFontSize, NULL);
    dic[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    return dic;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@""]) {
        return YES;
    }
    self.placeHolderLabel.hidden = YES;
    if (text.length != 0 && textView.attributedText.length >= _maxCount) {
        return NO;
    }
    if (textView.attributedText.length + text.length >= _maxCount) {
        text = [text substringToIndex:(_maxCount - textView.attributedText.length)];
    }
    NSAttributedString *att = [[NSAttributedString alloc] initWithString:text attributes:[self attributes]];
    NSMutableAttributedString *attMu = textView.attributedText.mutableCopy;
    [attMu appendAttributedString:att];
    textView.attributedText = attMu.copy;
    return NO;
}
-(void)textViewDidChange:(UITextView *)textView{
    if (!textView.text.length) {
        self.placeHolderLabel.hidden = NO;
    }else{
        self.placeHolderLabel.hidden = YES;
    }
}
@end
