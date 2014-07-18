//
//  ViewController.m
//  SettingListDemo
//
//  Created by Vols on 14-7-16.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import "ViewController.h"

#import "PersonalInfoViewController.h"
#import "ModifyMoblieViewController.h"
#import "ModifyPWDViewController.h"
#import "BlacklistViewController.h"

#import "FlatAlertView.h"

#define KG_APP_SIZE [[UIScreen mainScreen] bounds].size

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, FlatAlertViewDelegate>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, copy) NSArray * dataSource;
@property (nonatomic, copy) NSArray * sections;


@property (nonatomic, strong) UIImageView * avaterImgView;
@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * detailLabel;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
  [self testData];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  
  
  self.dataSource = @[@[@""], @[@"",@"邀请好友"],@[@"接收陌生好友推送",@"黑名单管理", @"更改绑定手机", @"修改密码"], @[@"把（产品）分享给朋友", @"关于（产品）", @"用户帮助",@"版本介绍",@"版本更新",@"意见反馈",@"鼓励一下", @"使用条款"],@[@""],];
  self.sections = @[@"个人信息",@"第三方授权",@"偏好设置",@"服务支持", @""];
  
  [self.view addSubview:self.tableView];
}

- (void)testData{
  self.avaterImgView.image = [UIImage imageNamed:@"ava"];
  self.detailLabel.text = @"27yer Shanghai";
  self.nameLabel.text = @"Sunzi Zhang";
  
}


- (NSArray *)dataSource{
  if (!_dataSource) {
    _dataSource = [[NSArray alloc] init];
  }
  return _dataSource;
}


- (NSArray *)sections{
  if (!_sections) {
    _sections = [[NSArray alloc] init];
  }
  return _sections;
}


- (UITableView *)tableView{
  
  if (!_tableView) {
    CGRect frame = CGRectMake(15, 0, 290, self.view.bounds.size.height - 64);
    _tableView = [[UITableView alloc] initWithFrame:frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
  }
  return _tableView;
}

- (UIImageView *)avaterImgView{
  if (!_avaterImgView) {
    _avaterImgView = [[UIImageView alloc] init];
    _avaterImgView.frame = CGRectMake(6, 4, 48, 48);
    //        _avaterImgView.image = [UIImage imageNamed:@"ava"];
    _avaterImgView.backgroundColor = [UIColor orangeColor];
  }
  
  return _avaterImgView;
}

- (UILabel *)nameLabel{
  if (!_nameLabel) {
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.frame = CGRectMake(60, 8, 200, 20);
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _nameLabel.text = @"name";
    _nameLabel.backgroundColor = [UIColor clearColor];
  }
  return _nameLabel;
}

- (UILabel *)detailLabel{
  if (!_detailLabel) {
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.frame = CGRectMake(60, 28, 200, 20);
    _detailLabel.font = [UIFont systemFontOfSize:14];
    _detailLabel.text = @"2 year";
    _detailLabel.backgroundColor = [UIColor clearColor];
  }
  return _detailLabel;
}



- (void)addSocialButtonToView:(UIView *) view{
  
  NSArray * normalImages = @[@"personal_notebook", @"personal_sina", @"personal_tencent"];
  NSArray * selectedImages = @[@"personal_notebook_h", @"personal_sina_h", @"personal_tencent_h"];
  
  for (int i = 0; i < 3; i ++) {
    
    
    UIButton * socialButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    socialButton.frame = CGRectMake(0, 0, [UIImage imageNamed:normalImages[i]].size.width, [UIImage imageNamed:normalImages[i]].size.height);
    socialButton.center = (CGPoint){30+60*i, 40};
    socialButton.tag = 500 + i;
    
    [socialButton setBackgroundImage:[UIImage imageNamed:normalImages[i]] forState:UIControlStateNormal];
    [socialButton setBackgroundImage:[UIImage imageNamed:selectedImages[i]] forState:UIControlStateHighlighted];
    [socialButton setBackgroundImage:[UIImage imageNamed:selectedImages[i]] forState:UIControlStateSelected];
    
    [socialButton addTarget:self action:@selector(socialAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:socialButton];
  }
}



#pragma mark - Actions

- (void)switchAction:(id)sender{
  
  UISwitch *sw = (UISwitch*)sender;
  
  BOOL isOn = sw.isOn;
  NSLog(@"%d", isOn);
}

- (void)socialAction:(UIButton *)button{
  
  switch (button.tag - 500) {
    case 0:
      [self bindNotebook];
      break;
      
    case 1:
      [self bindTencent];
      break;
      
    case 2:
      [self bindWeibo];
      break;
      
    default:
      break;
  }
}

- (void)bindNotebook{
  NSLog(@"%s", __FUNCTION__);
}

- (void)bindTencent{
  NSLog(@"%s", __FUNCTION__);

}

- (void)bindWeibo{
  NSLog(@"%s", __FUNCTION__);

}

#pragma mark - UITableViewDelegate Methods

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  
  UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
  headView.backgroundColor = [UIColor clearColor];
  
  UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
  label.font = [UIFont systemFontOfSize:15];
  label.text = _sections[section];
  
  [headView addSubview:label];
  
  return headView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
  return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  switch (section) {
    case 0:
      return 1;
      break;
    case 1:
      return 2;
      break;
    case 2:
      return 4;
      break;
    case 3:
      return 8;
      break;
    case 4:
      return 1;
      break;
    default:
      return 0;
      break;
  }
}



- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  switch (indexPath.section) {
    case 0:
      return 55;
      break;
    case 1:
      if (indexPath.row == 0) return 80;
      break;
      
    default:
      return 50;
      break;
  }
  
  return 50;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString * identifier = @"ID";
  
  UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
  }
  cell.contentView.backgroundColor = [UIColor clearColor];
  cell.selectionStyle = UITableViewCellSelectionStyleGray;
  
  for(UIView * view in cell.contentView.subviews){
    [view removeFromSuperview];
  }
  
  cell.textLabel.textColor = [UIColor colorWithWhite:0.293 alpha:1.000];
  cell.textLabel.text = _dataSource[indexPath.section][indexPath.row];
  cell.textLabel.font = [UIFont systemFontOfSize:15];
  
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  
  switch (indexPath.section) {
    case 0:{
      if (indexPath.row == 0) {
        [cell.contentView addSubview:self.avaterImgView];
        [cell.contentView addSubview:self.nameLabel];
        [cell.contentView addSubview:self.detailLabel];
        cell.textLabel.text = @"";
      }
    }
      break;
    case 1:{
      if (indexPath.row == 0) {
        [self addSocialButtonToView:cell.contentView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
      }
    }
      break;
      
    case 2:{
      if (indexPath.row == 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        UISwitch *sw = [[UISwitch alloc] init];
        sw.frame = CGRectMake(KG_APP_SIZE.width - 100, 0, 80, 30);
        sw.center = (CGPoint){sw.center.x, cell.bounds.size.height/2};
        sw.on = YES;
        [sw addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        [cell.contentView addSubview:sw];
      }
    }
      break;
    case 3:{
      
    }
      break;
      
    case 4:{
      cell.accessoryType = UITableViewCellAccessoryNone;
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
//      cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
//      cell.selectedBackgroundView.backgroundColor = [UIColor orangeColor];
      
      cell.contentView.backgroundColor = [UIColor colorWithRed:0.987 green:0.258 blue:0.365 alpha:1.000];
      UIImage * image = [UIImage imageNamed:@"power"];
      UIImageView * iView = [[UIImageView alloc] initWithImage:image];
      iView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
      iView.center = (CGPoint){cell.contentView.center.x+10, cell.contentView.center.y};
      [cell.contentView addSubview:iView];
    }
      break;
      
    default:
      break;
  }
  
  
  return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  switch (indexPath.section) {
    case 0:
      [self.navigationController pushViewController:[[PersonalInfoViewController alloc] init] animated:YES];
      break;
    case 2:{
      if (indexPath.row == 2) {
        [self.navigationController pushViewController:[[ModifyMoblieViewController alloc] init] animated:YES];

      }
    }
      break;
    case 4:{
      FlatAlertView * alertView = [[FlatAlertView alloc] initWithFrame:CGRectMake(0, KG_APP_SIZE.height - 160-64, 320, 160) withTitle:@"是否退出登陆" delegate:self];
      [self.view addSubview:alertView];
    }
      break;
    default:
      break;
  }
  
  if (indexPath.section != 4) {
      [self performSelector:@selector(deselect:) withObject:tableView afterDelay:0.2f];
  }
  else{

  }
  
}

- (void)deselect:(UITableView *)tableView
{
  [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  if (section == 4) {
    return 15;
  }
  else
    return 40;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  CGFloat sectionHeaderHeight = 40;
  if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
    scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
  } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
    scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
  }
}


- (void)flatAlertView:(FlatAlertView *)flatAlertView didSelectedIndex:(NSInteger)index
{
  NSLog(@"%d", index);
}


- (void)didReceiveMemoryWarning
{
  
  
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}





@end
