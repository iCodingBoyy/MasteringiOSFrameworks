//
//  ViewController.m
//  MasteringiOSFrameworks
//
//  Created by 远征 马 on 2019/9/2.
//  Copyright © 2019 马远征. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <QMUIKit/QMUIKit.h>

@interface ViewController ()
@property (nonatomic, strong) UIView *gradientContentView;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation ViewController

- (void)makeConstraints
{
    __weak typeof(self) weakSelf = self;
    _gradientContentView = [[UIView alloc]init];
    [self.view addSubview:_gradientContentView];
    [self.gradientContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        make.centerX.equalTo(strongSelf.view.mas_centerX);
        make.centerY.equalTo(strongSelf.view.mas_centerY);
        make.width.equalTo(@(240));
        make.height.equalTo(@(300));
    }];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _gradientLayer.frame = self.gradientContentView.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeConstraints];
    
    _gradientLayer = [CAGradientLayer layer];
    // 设置渐变颜色值
    _gradientLayer.colors = @[(__bridge id)[UIColor qmui_colorWithHexString:@"#FF4275"].CGColor,
                              (__bridge id)[UIColor qmui_colorWithHexString:@"#FDF4FA"].CGColor];
//    #F6568C #FDF4FA
    // 设置渐变分割位置
//    _gradientLayer.locations = @[@0.0, @0.35,@1.0];
    // 设置开始位置和结束点
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint = CGPointMake(1, 1);
    [self.gradientContentView.layer addSublayer:_gradientLayer];
}


@end
