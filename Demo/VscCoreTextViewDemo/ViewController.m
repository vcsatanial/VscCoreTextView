//
//  ViewController.m
//  VscCoreTextViewDemo
//
//  Created by Visac MBP on 2017/8/9.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import "ViewController.h"
#import "VscCoreTextView.h"
#import "VscLocalizedHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    VscLocalizedHelper *helper2 = [VscLocalizedHelper sharedHelper];
    [helper2 setBundleName:@"CTV.bundle" tableName:@"CurLanguage"];
    helper2.rememberLang = YES;
    helper2.curLanguage = @"zh-Hans-CN";
    NSLog(@"%@",[helper2 allAppLanguages]);
    
    VscCoreTextView *label = [[VscCoreTextView alloc] init];
    label.maxCount = 5;
    label.frame = CGRectMake(0, 40, 375, 300);
    label.allChooseStr = localizedStr(@"全选");
    label.addLinkStr = localizedStr(@"添加链接");
    label.maxCountStr = @"不多余4000字";
    label.useCoreTextTool = YES;
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
