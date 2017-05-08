//
//  RootViewController.m
//  TipMaskDemo
//
//  Created by iOS－Dev on 2017/5/8.
//  Copyright © 2017年 iOS－Dev. All rights reserved.
//

#import "RootViewController.h"
#import "Define.h"
#import "TipMaskView.h"
@interface RootViewController ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) TipMaskView *tipMaskView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"hasTipMask"]) {
        _tipMaskView = [[TipMaskView alloc]initWithImages:@[@"Propmt_main1",@"Propmt_main2"]];
        [defaults setBool:YES forKey:@"hasTipMask"];
    }
}

- (void)createUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"提示蒙版";
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, KScreenWidth, 60)];
    _label.text = @"主界面";
    _label.font = [UIFont systemFontOfSize:20];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
