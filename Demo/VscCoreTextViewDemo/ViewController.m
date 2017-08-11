//
//  ViewController.m
//  VscCoreTextViewDemo
//
//  Created by Visac MBP on 2017/8/9.
//  Copyright © 2017年 VincentChow. All rights reserved.
//

#import "ViewController.h"
#import "VscCoreTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    VscCoreTextView *label = [[VscCoreTextView alloc] init];
    label.frame = CGRectMake(0, 40, 375, 300);
    label.useCoreTextTool = YES;
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
