//
//  DiscoveryViewController.m
//  hymzs
//
//  Created by RayNi on 2018/1/17.
//  Copyright © 2018年 RayNi. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "DiscoveryTableViewCell.h"
@interface DiscoveryViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation DiscoveryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DiscoveryTableViewCell class]) bundle:nil] forCellReuseIdentifier:DiscoveryTableViewCellIdentifier];
    
    //tableView数据准备
    NSArray *array0 = [[NSArray alloc] initWithObjects:
                       @{@"title" : @"航空里程专区", @"image" : @""},
                       @{@"title" : @"刷卡撸分专区", @"image" : @""}, nil];
    NSArray *array1 = [[NSArray alloc] initWithObjects:
                       @{@"title" : @"神卡推荐", @"image" : @""}, nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:
                       @{@"title" : @"薅友交流", @"image" : @""}, nil];
    NSArray *array3 = [[NSArray alloc] initWithObjects:
                       @{@"title" : @"与开发者侃大山", @"image" : @""}, nil];
    self.dataArray = [[NSMutableArray alloc] initWithObjects:array0, array1, array2, array3, nil];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)self.dataArray[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiscoveryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:DiscoveryTableViewCellIdentifier];
    if(cell == nil)
    {
        cell = [[DiscoveryTableViewCell alloc] init];
    }
    NSArray *currentSectionDataArray = self.dataArray[indexPath.section];
    NSDictionary *data = currentSectionDataArray[indexPath.row];
    cell.title.text = [data valueForKey:@"title"];
    cell.topLineView.hidden = cell.bottonLineView.hidden = NO;
    if(indexPath.row == 0 && currentSectionDataArray.count > 1)
    {
        cell.bottonLineView.hidden = YES;
    }
    
    if(indexPath.row == currentSectionDataArray.count - 1 && currentSectionDataArray.count > 1)
    {
        cell.topLineView.hidden = YES;
    }
    
    if(indexPath.row != 0&& indexPath.row != currentSectionDataArray.count - 1)
    {
        cell.topLineView.hidden = cell.bottonLineView.hidden = YES;
    }
    
    if(indexPath.section == self.dataArray.count -1 && indexPath.row == currentSectionDataArray.count - 1)
    {
        cell.separatorInset = UIEdgeInsetsMake(0, ScreenWidth, 0, 0);
    }
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
