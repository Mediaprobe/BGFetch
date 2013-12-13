//
//  bgvViewController.h
//  BGFetch
//
//  Created by Kenji Imai on 2013/11/28.
//  Copyright (c) 2013年 Kenji Imai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bgvAppDelegate.h"

@interface bgvViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>{
IBOutlet UITableView *dateList;

IBOutlet UILabel *loadDate;
IBOutlet UILabel *update;
}
@end

