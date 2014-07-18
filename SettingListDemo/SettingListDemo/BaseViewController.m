//
//  BaseViewController.m
//  SettingListDemo
//
//  Created by Vols on 14-7-18.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
  self.view.backgroundColor = [UIColor colorWithRed:0.946 green:0.936 blue:0.941 alpha:1.000];

  [self updateNavBar];
}


//更新导航栏
- (void)updateNavBar
{
  if (IS_IOS7) {
    UIBarButtonItem *returnButtonItem = [[UIBarButtonItem alloc] init];
    returnButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = returnButtonItem;
//    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
  }
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
