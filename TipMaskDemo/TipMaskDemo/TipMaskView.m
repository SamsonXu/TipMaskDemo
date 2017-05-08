//
//  TipMaskView.m
//  TestProject
//
//  Created by iOS－Dev on 2017/5/8.
//  Copyright © 2017年 iOS－Dev. All rights reserved.
//

#import "TipMaskView.h"
#import "Define.h"
@implementation TipMaskView

-(instancetype)initWithImages:(NSArray *)images{
    
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.imageArray = images;
    }
    return self;
}

- (void)setImageArray:(NSArray *)imageArray{
    
    _imageArray = imageArray;
    _remainCount = imageArray.count;
    
    self.imageView = [[UIImageView alloc]initWithFrame:self.frame];
    self.imageView.image = [UIImage imageNamed:imageArray[0]];
    if (KIPHONE6 == NO) {
        self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_temp",imageArray[0]]];
    }else{
        self.imageView.image = _imageArray[0];
    };
    self.imageView.userInteractionEnabled = YES;
    [self addSubview:self.imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMask:)];
    [self addGestureRecognizer:tap];

    
    [[UIApplication sharedApplication].windows.lastObject addSubview:self];
}

- (void)hideMask:(UITapGestureRecognizer *)sender{
 
    __weak typeof(self) weakSelf = self;
    _remainCount--;
    
    if (_remainCount == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.alpha = 0;
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
            sender.enabled = YES;
        }];
    }else{
        
        if (KIPHONE6 == NO) {
            self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_temp",_imageArray[_imageArray.count-_remainCount]]];
        }else{
            self.imageView.image = _imageArray[_imageArray.count-_remainCount];
        };
    }
    
}

@end
