//
//  ConstantsManager.h
//  hymzs
//
//  Created by RayNi on 2018/1/16.
//  Copyright © 2018年 RayNi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstantsManager : NSObject
@property (nonatomic, strong) NSMutableArray *allBanks;
@property (nonatomic, strong) NSMutableDictionary *bankInfo;
@property (nonatomic, strong) NSMutableArray *selectedBanks;
+ (instancetype)sharedInstance;
+ (void)updateSelectedBanksby:(NSArray *)array;
@end
