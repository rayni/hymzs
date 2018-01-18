//
//  DiscoveryTableViewCell.h
//  hymzs
//
//  Created by RayNi on 2018/1/17.
//  Copyright © 2018年 RayNi. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *DiscoveryTableViewCellIdentifier = @"DiscoveryTableViewCellIdentifier";
@interface DiscoveryTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *topLineView;
@property (strong, nonatomic) IBOutlet UIView *bottonLineView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *title;
@end
