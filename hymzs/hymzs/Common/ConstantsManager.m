//
//  ConstantsManager.m
//  hymzs
//
//  Created by RayNi on 2018/1/16.
//  Copyright © 2018年 RayNi. All rights reserved.
//

#import "ConstantsManager.h"
static ConstantsManager *_SharedInstanceOfConstantsManager;
@implementation ConstantsManager

+ (instancetype)sharedInstance
{
    @synchronized(self){
        
        if (_SharedInstanceOfConstantsManager == nil)
        {
            _SharedInstanceOfConstantsManager = [[self alloc] init];
            [ConstantsManager sharedInstance].allBanks = [[NSMutableArray alloc] initWithObjects:@"中信",@"广发",@"浦发",@"交行",@"建行",
            @"农行",@"华夏",@"工行",@"中行",@"邮政",@"兴业",nil];
            NSArray *selectedBanksHistroy = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedBanksHistroy"];
            if(selectedBanksHistroy != nil)
            {
                [ConstantsManager sharedInstance].selectedBanks = [[NSMutableArray alloc] initWithArray:selectedBanksHistroy];
            }
            else
            {
                [ConstantsManager sharedInstance].selectedBanks = [[NSMutableArray alloc] init];
            }
            [ConstantsManager sharedInstance].bankInfo = [[NSMutableDictionary alloc] init];
            [[ConstantsManager sharedInstance].bankInfo setObject:@{@"name" : @"中信银行", @"image" : @"中信"} forKey:@"中信"];
            [[ConstantsManager sharedInstance].bankInfo setObject:@{@"name" : @"浦发银行", @"image" : @"浦发"} forKey:@"浦发"];
            [[ConstantsManager sharedInstance].bankInfo setObject:@{@"name" : @"广发银行", @"image" : @"广发"} forKey:@"广发"];
            [[ConstantsManager sharedInstance].bankInfo setObject:@{@"name" : @"建设银行", @"image" : @"建行"} forKey:@"建行"];
            [[ConstantsManager sharedInstance].bankInfo setObject:@{@"name" : @"中国银行", @"image" : @"中行"} forKey:@"中行"];
            [[ConstantsManager sharedInstance].bankInfo setObject:@{@"name" : @"农业银行", @"image" : @"农行"} forKey:@"农行"];
            [[ConstantsManager sharedInstance].bankInfo setObject:@{@"name" : @"工商银行", @"image" : @"工行"} forKey:@"工行"];
        }
        return _SharedInstanceOfConstantsManager;
    }
}

+ (void)updateSelectedBanksby:(NSArray *)array
{
    [[ConstantsManager sharedInstance].selectedBanks removeAllObjects];
    [[ConstantsManager sharedInstance].selectedBanks addObjectsFromArray:array];
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"selectedBanksHistroy"];
}

@end
