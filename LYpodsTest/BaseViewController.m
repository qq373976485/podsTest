//
//  BaseViewController.m
//  BoardOfChalk
//
//  Created by 张松伟 on 2017/9/19.
//  Copyright © 2017年 iSong. All rights reserved.
//

#import "BaseViewController.h"
#import "MMLoadingHUD.h"
#import "MMLoadingView.h"

@interface BaseViewController ()

@property (nonatomic,strong) UIView * failedView;
@property (nonatomic,strong) UIImageView * emptyImageV;

@end

@implementation BaseViewController

#pragma mark -- init
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KBGColor;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view endEditing:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark -- Public Method

- (void)setFailedViewCallBack:(failedCallback)callBack
{
    self.failedView.hidden=NO;
    [self.view bringSubviewToFront:self.failedView];
    self.callback = callBack;
}

- (void)addEmptyViewWith:(NSString *)image
{
    self.emptyImageV.image=[UIImage imageNamed:image];
}

- (void)removeEmptyView
{
    [self.emptyImageV removeFromSuperview];
}

- (void)showLoadingView
{
    [MMLoadingView showLoadingView:self.view];
}

- (void)showLoadingViewWithTitle:(NSString *)title
{
    [MMLoadingView showLaodingView:self.view title:title];
}

- (void)hideLoadingView
{
    [MMLoadingView hideLoadingView];
}

- (void)showAlertWithTitle:(NSString *)title
{
    [MMLoadingHUD showAlertWithView:self.view title:title];
}

- (void)showAlertWithError:(NSString *)title
{
    [MMLoadingHUD showAlertWithErrorView:self.view title:title];
}

- (void)showAlertWithSuccess:(NSString *)title
{
    [MMLoadingHUD showAlertWithSuccessView:self.view title:title];
}

- (void)loadData
{
    self.failedView.hidden=YES;
    if (self.callback) {
        self.callback();
    }
}

#pragma mark -- 懒加载

- (UIView *)failedView
{
    if (!_failedView) {
        _failedView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, KScreenWidth, KScreenHeight))];
        _failedView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_failedView];
        UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.frame = CGRectMake(KScreenWidth*0.5-63.5,KScreenHeight*0.35-93 , 127, 186);
        [button setBackgroundImage:[UIImage imageNamed:@"加载失败_pic"] forState:(UIControlStateNormal)];
        [button setBackgroundImage:[UIImage imageNamed:@"加载失败_pic"] forState:(UIControlStateHighlighted)];
        [button addTarget:self action:@selector(loadData) forControlEvents:(UIControlEventTouchUpInside)];
        [_failedView addSubview:button];
        _failedView.hidden = YES;
    }
    return _failedView;
}

- (UIImageView *)emptyImageV
{
    if (!_emptyImageV) {
        _emptyImageV = [[UIImageView alloc]initWithFrame:kScreen_Bounds];
        _emptyImageV.userInteractionEnabled = YES;
        _emptyImageV.contentMode = UIViewContentModeCenter;
        _emptyImageV.center = CGPointMake(self.view.centerX, self.view.centerY*0.8);
        [self.view addSubview:_emptyImageV];
    }
    return _emptyImageV;
}

@end
