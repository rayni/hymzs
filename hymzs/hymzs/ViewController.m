//
//  ViewController.m
//  hymzs
//
//  Created by RayNi on 2018/1/16.
//  Copyright © 2018年 RayNi. All rights reserved.
//

#import "ViewController.h"
#import "AllBanksCollectionViewCell.h"
#import "ActivityTableViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *allBankShowView;
@property (strong, nonatomic) IBOutlet UICollectionView *allBankListView;
@property (strong, nonatomic) IBOutlet UIView *selectedBankListView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL ifSelectingBanks;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //全部银行展示页面初始化
    self.ifSelectingBanks = NO;
    self.allBankShowView.alpha = 0;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((ScreenWidth - 110)/5, 35);
    // 设置最小行间距
    layout.minimumLineSpacing = 10;
    // 设置垂直间距
    layout.minimumInteritemSpacing = 15;
    // 设置滚动方向（默认垂直滚动）
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.allBankListView setCollectionViewLayout:layout];
    self.allBankListView.contentSize = CGSizeMake(ScreenWidth-20, 150);
    self.allBankListView.frame = CGRectMake(0, 0, ScreenWidth - 20, 150);
    self.allBankListView.dataSource = self;
    self.allBankListView.delegate = self;
    [self.allBankListView registerNib:[UINib nibWithNibName:NSStringFromClass([AllBanksCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:AllBanksCollectionViewCellIdentifier];
    
    //活动tableview初始化
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ActivityTableViewCell class]) bundle:nil] forCellReuseIdentifier:ActivityTableViewCellIdentifier];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectBtnTapped:(id)sender {
    CGRect frame = self.allBankListView.frame;
    if(self.ifSelectingBanks == YES)
    {
        //隐藏全部银行
        [UIView animateWithDuration:0.5 animations:^{
            self.allBankListView.frame = CGRectMake(25,  - frame.size.height, frame.size.width, frame.size.height);
            self.allBankShowView.alpha = 0;
        }];
    }
    else
    {
        //展示全部银行
        [UIView animateWithDuration:0.5 animations:^{
            self.allBankListView.frame = CGRectMake(25, 15, frame.size.width, frame.size.height);
            self.allBankShowView.alpha = 1;
        }];
    }
    self.ifSelectingBanks = !self.ifSelectingBanks;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [ConstantsManager sharedInstance].allBanks.count + 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AllBanksCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AllBanksCollectionViewCellIdentifier forIndexPath:indexPath];
    if(indexPath.row == 0)
    {
        cell.label.text = @"全部";
    }
    else
    {
        cell.label.text = [ConstantsManager sharedInstance].allBanks[indexPath.row - 1];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ActivityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ActivityTableViewCellIdentifier];
    return cell;
}





@end
