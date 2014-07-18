//
//  ChangeMoblieViewController.m
//  SettingListDemo
//
//  Created by Vols on 14-7-18.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import "ModifyMoblieViewController.h"

@interface ModifyMoblieViewController ()

@property (nonatomic, strong) UITextField * mobileTextField;

@end

@implementation ModifyMoblieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

  self.navigationItem.title = @"更改绑定的手机";
  
  
  [self addViews];
}

- (void)addViews{
  
  UIView * bgInputView = [[UIView alloc] init];
  bgInputView.frame = CGRectMake(10, 20, 300, 50);
  bgInputView.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:bgInputView];

  [self.view addSubview:self.mobileTextField];
}

- (UITextField *)mobileTextField{
  if (!_mobileTextField) {
    _mobileTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 280, 50)];
    _mobileTextField.textAlignment = NSTextAlignmentLeft;
    //  _mobileTextField.font =  [UIFont fontWithName:kFontName size:14];
    _mobileTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _mobileTextField.returnKeyType = UIReturnKeyDone;
    _mobileTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _mobileTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  }
  return _mobileTextField;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
