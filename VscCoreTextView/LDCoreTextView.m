//
//  LDCoreTextView.m
//  iLifeDiary
//
//  Created by Visac MBP on 2017/8/7.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import "LDCoreTextView.h"
#import <CoreText/CoreText.h>
#import "LDCoreTextTool.h"

@interface LDCoreTextView (){
    NSMutableArray *coreTextMutableArray;
}

@end

@implementation LDCoreTextView
-(instancetype)init{
    if (self = [super init]) {
        
        _fontSize = 16;
        _lineSpace = 8.f;
        _textViewColor = HEXCOLOR(0x000000);
    }
    return self;
}
-(void)setCoreTextArray:(NSArray *)coreTextArray{
    coreTextMutableArray = coreTextArray.mutableCopy;
}
-(NSArray *)coreTextArray{
    return coreTextMutableArray.copy;
}
-(LDCoreTextData *)data{
    if (!_data) {
        _data = [[LDCoreTextData alloc] init];
    }
    return _data;
}
-(void)parseAttributedContent:(NSAttributedString *)content{
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)content);
    CGSize restrictSeze = CGSizeMake(self.frame.size.width, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSeze, nil);
    CGFloat textHeight = coreTextSize.height;
    
    CTFrameRef frame = [self createFrameWithFramesetter:framesetter height:textHeight];
    self.data.coreTextFrame = frame;
    CFRelease(frame);
    CFRelease(framesetter);
}
-(CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter height:(CGFloat)height{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, self.frame.size.width, height));
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    return frame;
}
-(void)parseCoreTextArray:(NSArray *)array{
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] init];
    for (NSDictionary *dict in array) {
        NSAttributedString *attributedString = [self parseAttributedContentFromDic:dict];
        [result appendAttributedString:attributedString];
    }
    [self parseAttributedContent:result.copy];
}
-(NSAttributedString *)parseAttributedContentFromDic:(NSDictionary *)dict{
    NSMutableDictionary *attributes = self.attributes.mutableCopy;
    NSString *content = dict[@"text"];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:content attributes:attributes];
    return attributedString;
}
-(NSDictionary *)attributes{
    CGFloat fontSize = self.fontSize;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"STHeitiSC-Light", fontSize, NULL);
    CGFloat lineSpacing = self.lineSpace;
    const CFIndex kNumsOfSettings = 3;
    CTParagraphStyleSetting settings[kNumsOfSettings] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment,sizeof(CGFloat),&lineSpacing},
        {kCTParagraphStyleSpecifierMaximumLineSpacing,sizeof(CGFloat),&lineSpacing},
        {kCTParagraphStyleSpecifierMinimumLineSpacing,sizeof(CGFloat),&lineSpacing}
    };
    CTParagraphStyleRef paragraphRef = CTParagraphStyleCreate(settings, kNumsOfSettings);
    UIColor *textColor = self.textViewColor;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[(id)kCTForegroundColorAttributeName] = (__bridge id)textColor.CGColor;
    dict[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dict[(id)kCTParagraphStyleAttributeName] = (__bridge id)paragraphRef;
    CFRelease(paragraphRef);
    CFRelease(fontRef);
    return dict;
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    if (self.data) {
        CTFrameDraw(self.data.coreTextFrame, context);
    }
}
-(void)setToolBar:(LDCoreTextTool *)toolBar{
    self.inputAccessoryView = toolBar;
    toolBar.didClick = ^(ClickType type, BOOL isChosen, id others) {
        NSLog(@"%d",type);
        NSLog(@"%d",isChosen);
    };
}
-(void)setCoreText:(NSAttributedString *)coreText{
    _coreText = coreText;
}
@end
