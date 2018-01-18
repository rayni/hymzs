//
//  BaseTabBarViewController.m
//  hymzs
//
//  Created by RayNi on 2018/1/17.
//  Copyright © 2018年 RayNi. All rights reserved.
//

#import "BaseTabBarViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabBarItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTabBarItems
{
    NSArray *noSelectedImages = [[NSArray alloc]
                                 initWithObjects:[[UIImage imageNamed:@"ActivityTabBar2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                                 [[UIImage imageNamed:@"DiscoveryTabBar2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                                 [[UIImage imageNamed:@"MeTabBar2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],nil];
    NSArray *selectedImages = [[NSArray alloc]
                               initWithObjects:[[UIImage imageNamed:@"ActivityTabBar"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                               [[UIImage imageNamed:@"DiscoveryTabBar"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                               [[UIImage imageNamed:@"MeTabBar"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],nil];
    NSArray *tabBarTitles = [[NSMutableArray alloc] initWithArray:@[@"活动",@"发现",@"我的"]];
    for(int i = 0; i < 3; i++){
        UINavigationController *navi = self.viewControllers[i];
        UITabBarItem* tabrItem = [[UITabBarItem alloc]initWithTitle:tabBarTitles[i] image:noSelectedImages[i] selectedImage:selectedImages[i]];
        
        NSMutableDictionary* textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHex:0x6A647E];
        textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13.0];
        [tabrItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
        
        NSMutableDictionary* selectTextAttrs = [NSMutableDictionary dictionary];
        selectTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHex:0xEA4E23];
        selectTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13.0];
        [tabrItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
        navi.tabBarItem = tabrItem;
    }
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
