//
//  PersonalInfoViewController.m
//  SettingListDemo
//
//  Created by Vols on 14-7-18.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import "PersonalInfoViewController.h"

@interface PersonalInfoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, copy) NSArray * dataSource;

@property (nonatomic, strong) UIImageView * avaterImgView;
@property (nonatomic, strong) UILabel * moblieLabel;
@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * genderLabel;
@property (nonatomic, strong) UILabel * birthLabel;
@property (nonatomic, strong) UILabel * areaLabel;
@property (nonatomic, strong) UILabel * signLabel;


@end

@implementation PersonalInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
  [self initData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  self.dataSource = @[@"头像:", @"电话:", @"用户名:", @"性别:", @"出生日期:", @"地址:", @"个人签名:"];
  [self.view addSubview:self.tableView];
}

- (void)initData{
  self.avaterImgView.image = [UIImage imageNamed:@"ava"];
  self.moblieLabel.text = @"13810086086";
  self.nameLabel.text = @"Sunzi Zhang";
  self.genderLabel.text = @"女";
  self.birthLabel.text = @"1956 10 01";
  self.areaLabel.text = @"北京";
  self.signLabel.text = @"我是可口可乐";
}

#pragma mark - properties

- (NSArray *)dataSource{
  if (!_dataSource) {
    _dataSource = [[NSArray alloc] init];
  }
  return _dataSource;
}

- (UITableView *)tableView{
  
  if (!_tableView) {
    CGRect frame = CGRectMake(15, 20, 290, 350);
    _tableView = [[UITableView alloc] initWithFrame:frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
  }
  return _tableView;
}


- (UIImageView *)avaterImgView{
  if (!_avaterImgView) {
    _avaterImgView = [[UIImageView alloc] init];
    _avaterImgView.frame = CGRectMake(KG_APP_SIZE.width - 80, 0, 50, 50);
    //        _avaterImgView.image = [UIImage imageNamed:@"ava"];
    _avaterImgView.backgroundColor = [UIColor orangeColor];
  }
  
  return _avaterImgView;
}

- (UILabel *)moblieLabel{
  if (!_moblieLabel) {
    _moblieLabel = [self createLable];
  }
  return _moblieLabel;
}



- (UILabel *)nameLabel{
  if (!_nameLabel) {
    _nameLabel = [self createLable];
  }
  return _nameLabel;
}


- (UILabel *)genderLabel{
  if (!_genderLabel) {
    _genderLabel = [self createLable];
  }
  return _genderLabel;
}


- (UILabel *)birthLabel{
  if (!_birthLabel) {
    _birthLabel = [self createLable];
  }
  return _birthLabel;
}


- (UILabel *)areaLabel{
  if (!_areaLabel) {
    _areaLabel = [self createLable];
  }
  return _areaLabel;
}


- (UILabel *)signLabel{
  if (!_signLabel) {
    _signLabel = [self createLable];
  }
  return _signLabel;
}


- (UILabel *)createLable{
  UILabel * label = [[UILabel alloc] init];
  label.frame = CGRectMake(KG_APP_SIZE.width - 235, 0, 200, 50);
  label.backgroundColor = [UIColor clearColor];
  label.textAlignment = NSTextAlignmentRight;
  label.textColor = [UIColor colorWithWhite:0.293 alpha:1.000];
  label.font = [UIFont systemFontOfSize:15];
  return label;
}

#pragma mark - UITableViewDelegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return _dataSource.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 50;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString * identifier = @"ID";
  
  UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
  }
  
  for(UIView * view in cell.contentView.subviews){
    [view removeFromSuperview];
  }
  
  cell.selectionStyle = UITableViewCellSelectionStyleGray;
  
  cell.textLabel.textColor = [UIColor colorWithWhite:0.293 alpha:1.000];
  cell.textLabel.font = [UIFont systemFontOfSize:15];
  cell.textLabel.text = _dataSource[indexPath.row];
  
  
  switch (indexPath.row) {
    case 0:{
      [cell.contentView addSubview:self.avaterImgView];
    }
      break;
    case 1:{
      [cell.contentView addSubview:self.moblieLabel];
    }
      break;
    case 2:{
      [cell.contentView addSubview:self.nameLabel];
    }
      break;
    case 3:{
      [cell.contentView addSubview:self.genderLabel];
    }
      break;
    case 4:{
      [cell.contentView addSubview:self.birthLabel];
    }
      break;
    case 5:{
      [cell.contentView addSubview:self.areaLabel];
    }
      break;
    case 6:{
      [cell.contentView addSubview:self.signLabel];
    }
      break;
      
    default:
      break;
  }
  
  
  return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self performSelector:@selector(deselect:) withObject:tableView afterDelay:0.2f];
}

- (void)deselect:(UITableView *)tableView
{
  [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
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
