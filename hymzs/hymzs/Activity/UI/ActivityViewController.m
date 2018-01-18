//
//  ViewController.m
//  hymzs
//
//  Created by RayNi on 2018/1/16.
//  Copyright © 2018年 RayNi. All rights reserved.
//

#import "ActivityViewController.h"
#import "AllBanksCollectionViewCell.h"
#import "ActivityTableViewCell.h"

@interface ActivityViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *allBankShowView;
@property (strong, nonatomic) IBOutlet UICollectionView *allBankListView;
@property (strong, nonatomic) IBOutlet UIView *selectedBankListView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *selectedBanksLabel;

@property (nonatomic) BOOL ifSelectingBanks;

@property (nonatomic, strong) NSMutableDictionary *activityDictionary;
@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏设置
    
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
    self.allBankListView.allowsSelection = YES;
    self.allBankListView.allowsMultipleSelection = YES;
    
    //活动tableview初始化
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ActivityTableViewCell class]) bundle:nil] forCellReuseIdentifier:ActivityTableViewCellIdentifier];
    
    [self updateSelectedBankLabel];

    //活动总字典
    self.activityDictionary  = [[NSMutableDictionary alloc] init];
    //中行活动
    NSMutableArray *zhArray = [[NSMutableArray alloc] init];
    [zhArray addObject:@{@"title"    : @"必胜客消费满200减60",
                         @"subtitle" : @"每周日及部分特殊节假日",
                         @"deadline" : @"2018年5月28日",
                         @"image"    : @"中行必胜客",
                         @"url"      : @""
                         }];
    [self.activityDictionary setObject:zhArray forKey:@"中行"];
    
    //中信活动
    NSMutableArray *zxArray = [[NSMutableArray alloc] init];
    [zxArray addObject:@{@"title"    : @"",
                         @"subtitle" : @"",
                         @"deadline" : @"",
                         @"image"    : @"",
                         @"url"      : @""
                         }];
    [zxArray addObject:@{@"title"    : @"",
                         @"subtitle" : @"",
                         @"deadline" : @"",
                         @"image"    : @"",
                         @"url"      : @""
                         }];
    [zxArray addObject:@{@"title"    : @"",
                         @"subtitle" : @"",
                         @"deadline" : @"",
                         @"image"    : @"",
                         @"url"      : @""
                         }];
    [zxArray addObject:@{@"title"    : @"",
                         @"subtitle" : @"",
                         @"deadline" : @"",
                         @"image"    : @"",
                         @"url"      : @""
                         }];
    [zxArray addObject:@{@"title"    : @"",
                         @"subtitle" : @"",
                         @"deadline" : @"",
                         @"image"    : @"",
                         @"url"      : @""
                         }];
    [self.activityDictionary setObject:zxArray forKey:@"中信"];
    
    //广发活动
    NSMutableArray *gfArray = [[NSMutableArray alloc] init];
    [gfArray addObject:@{@"title"    : @"",
                         @"subtitle" : @"",
                         @"deadline" : @"",
                         @"image"    : @"",
                         @"url"      : @""
                         }];
    [self.activityDictionary setObject:gfArray forKey:@"广发"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rightBarBtnTapped:(id)sender
{
    [self selectBtnTapped:nil];
}

- (IBAction)selectBtnTapped:(UIButton *)sender {
    CGRect frame = self.allBankListView.frame;
    if(self.ifSelectingBanks == YES)
    {
        //隐藏全部银行
        [UIView animateWithDuration:0.5 animations:^{
            self.allBankListView.frame = CGRectMake(25,  - frame.size.height, frame.size.width, frame.size.height);
            self.allBankShowView.alpha = 0;
        }];
        [self.navigationItem.rightBarButtonItem setImage:[UIImage imageNamed:@"筛选"]];
    }
    else
    {
        //展示全部银行
        [UIView animateWithDuration:0.5 animations:^{
            self.allBankListView.frame = CGRectMake(25, 15, frame.size.width, frame.size.height);
            self.allBankShowView.alpha = 1;
        }];
        UIBarButtonItem *item = self.navigationItem.rightBarButtonItem;
        [self.navigationItem.rightBarButtonItem setImage:nil];
//        [self.navigationItem.rightBarButtonItem setTitle:@"完成"];
    }
    self.ifSelectingBanks = !self.ifSelectingBanks;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [ConstantsManager sharedInstance].allBanks.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AllBanksCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AllBanksCollectionViewCellIdentifier forIndexPath:indexPath];
    NSString *bank = [ConstantsManager sharedInstance].allBanks[indexPath.row];
    cell.label.text = bank;
    if([[ConstantsManager sharedInstance].selectedBanks containsObject:bank])
    {
        
        cell.backgroundColor = [UIColor darkGrayColor];
    }
    else
    {
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.selected = NO;
    }
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AllBanksCollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    //通过背景色来判断是否被选中  深灰为选中  浅灰为未选中
    if([cell.backgroundColor isEqual:[UIColor darkGrayColor]])
    {
        cell.backgroundColor = [UIColor lightGrayColor];
        NSString *currentBank = [ConstantsManager sharedInstance].allBanks[indexPath.row];
        for(NSInteger i = 0; i < [ConstantsManager sharedInstance].selectedBanks.count; i++)
        {
            if([[ConstantsManager sharedInstance].selectedBanks[i] isEqualToString:currentBank])
            {
                [[ConstantsManager sharedInstance].selectedBanks removeObjectAtIndex:i];
                break;
            }
        }
    }
    else
    {
        cell.backgroundColor = [UIColor darkGrayColor];
        NSString *bank = [ConstantsManager sharedInstance].allBanks[indexPath.row];
        if(![[ConstantsManager sharedInstance].selectedBanks containsObject:bank])
        {
            [[ConstantsManager sharedInstance].selectedBanks addObject:bank];
        }
    }
    //更新已选银行数据
    [ConstantsManager updateSelectedBanksby:[ConstantsManager sharedInstance].selectedBanks];
    [self updateSelectedBankLabel];
    [self.tableView reloadData];
    return YES;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self collectionView:collectionView shouldSelectItemAtIndexPath:indexPath];
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [ConstantsManager sharedInstance].selectedBanks.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    NSString *selectedBank = [ConstantsManager sharedInstance].selectedBanks[section];
    NSArray *selectedBankActivities = [self.activityDictionary objectForKey:selectedBank];
    return selectedBankActivities.count;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [ConstantsManager sharedInstance].selectedBanks[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ActivityTableViewCellIdentifier];
    if(cell == nil)
    {
        cell = [[ActivityTableViewCell alloc] init];
    }
    return cell;
}

- (void)updateSelectedBankLabel
{
    //已选银行label设置
    NSString *selectedBanksStr = @"";
    for(NSInteger i = 0; i < [ConstantsManager sharedInstance].selectedBanks.count; i++)
    {
        NSString *bank = [ConstantsManager sharedInstance].selectedBanks[i];
        if(i < 5)
        {
            selectedBanksStr = [NSString stringWithFormat:@"%@ %@ ", selectedBanksStr, bank];
        }
        else
        {
            selectedBanksStr = [NSString stringWithFormat:@"%@等%lu家银行", selectedBanksStr,(unsigned long)[ConstantsManager sharedInstance].selectedBanks.count];
            break;
        }
    }
    self.selectedBanksLabel.text = selectedBanksStr;
}
@end
