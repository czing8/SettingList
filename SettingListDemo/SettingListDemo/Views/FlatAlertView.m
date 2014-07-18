//
//  CustomAlertView.m
//  SettingListDemo
//
//  Created by Vols on 14-7-18.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import "FlatAlertView.h"
#import "FlatButton.h"

@interface FlatAlertView ()


@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) UIButton * confirmButton;
@property (nonatomic, strong) FlatButton * cancelButton;

@end

@implementation FlatAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)dealloc{
  _confirmButton = nil;
  _cancelButton = nil;
}

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title delegate:(id)delegate
{
  self = [super initWithFrame:frame];
  if (self) {
    self.title = title;
    self.delegate = delegate;
  }
  return self;
}


- (void)layoutSubviews{
  
  self.backgroundColor = [UIColor blackColor];
  
  self.alpha = 0.8;
  UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
  label.center = (CGPoint){self.bounds.size.width/2, 30};
  label.text = self.title;
  label.textAlignment = NSTextAlignmentCenter;
  label.textColor = [UIColor whiteColor];
  [self addSubview:label];
  
  [self addSubview:self.confirmButton];
  [self addSubview:self.cancelButton];
}

#pragma mark - Properties

- (UIButton *)confirmButton{
  if (!_confirmButton) {
    _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _confirmButton.frame = CGRectMake(0, 0, 280, 44);
    _confirmButton.center = CGPointMake(160, 70);
    _confirmButton.tag = 1000;
    _confirmButton.backgroundColor = [UIColor colorWithRed:0.330 green:0.744 blue:0.714 alpha:1.000];
    [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    _confirmButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:18.0];

    _confirmButton.layer.cornerRadius = 22;
    [_confirmButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_confirmButton addTarget:self action:@selector(touchDownAction:) forControlEvents:UIControlEventTouchDown];
//    [_confirmButton addTarget:self action:@selector(touchUpAction:) forControlEvents:UIControlEventTouchUpOutside];


  }
  return _confirmButton;
}


- (FlatButton *)cancelButton{
  if (!_cancelButton) {
    _cancelButton = [[FlatButton alloc] init];
    _cancelButton.frame = CGRectMake(0, 0, 280, 44);
    _cancelButton.center = CGPointMake(160, 120);
    _cancelButton.tag = 1001;
    [_cancelButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:18.0];
    [_cancelButton setTitleColor:[UIColor colorWithRed:0.330 green:0.744 blue:0.714 alpha:1.000] forState:UIControlStateNormal];
  }
  return _cancelButton;
}




#pragma mark - Actions

- (void)clickAction:(UIButton *)button{

  [self.delegate flatAlertView:self didSelectedIndex:button.tag -1000];
  
  if (button.tag - 1000 == 0) {
    button.backgroundColor = [UIColor colorWithRed:0.330 green:0.744 blue:0.714 alpha:1.000];
  }
  else if (button.tag - 1000 ==1){
    [self removeFromSuperview];
  }
}

- (void)touchDownAction:(UIButton *)button{
  button.backgroundColor = [UIColor colorWithRed:0.40 green:0.784 blue:0.78 alpha:1.000];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
