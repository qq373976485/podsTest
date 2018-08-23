//
//  BaseViewController.h
//  BoardOfChalk
//
//  Created by 张松伟 on 2017/9/19.
//  Copyright © 2017年 iSong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^failedCallback)(void);

@interface BaseViewController : UIViewController

@property (nonatomic,copy)failedCallback callback;


- (void)setFailedViewCallBack:(failedCallback)callBack;

- (void)addEmptyViewWith:(NSString *)image;

- (void)removeEmptyView;

- (void)showLoadingView;
- (void)showLoadingViewWithTitle:(NSString *)title;
- (void)hideLoadingView;
- (void)showAlertWithTitle:(NSString *)title;
- (void)showAlertWithError:(NSString *)title;
- (void)showAlertWithSuccess:(NSString *)title;


@end
