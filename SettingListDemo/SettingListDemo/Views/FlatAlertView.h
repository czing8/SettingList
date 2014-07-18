//
//  CustomAlertView.h
//  SettingListDemo
//
//  Created by Vols on 14-7-18.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlatAlertView;
@protocol FlatAlertViewDelegate <NSObject>

- (void)flatAlertView:(FlatAlertView *)flatAlertView didSelectedIndex:(NSInteger)index;

@end

@interface FlatAlertView : UIView

@property (nonatomic, assign)id<FlatAlertViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title delegate:(id)delegate;

@end
