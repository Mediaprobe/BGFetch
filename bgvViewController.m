//
//  bgvViewController.m
//  BGFetch
//
//  Created by Kenji Imai on 2013/11/28.
//  Copyright (c) 2013年 Kenji Imai. All rights reserved.
//

#import "bgvViewController.h"

@interface bgvViewController () {
    bgvAppDelegate *appDelegate;
}

@end

@implementation bgvViewController

- (void)viewDidLoad
{
    appDelegate = (bgvAppDelegate *)[[UIApplication sharedApplication] delegate];
    [super viewDidLoad];
    [self.tableView reloadData];
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return appDelegate.loadingDate.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        loadDate = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
        update = [[UILabel alloc] initWithFrame:CGRectMake(290, 10, 20, 20)];
        loadDate.tag = 1000;
        update.tag = 1001;
        update.textColor = [UIColor orangeColor];
        [cell addSubview:loadDate];
        [cell addSubview:update];
    } else {
        loadDate = (UILabel *)[cell viewWithTag:1000];
        update = (UILabel *)[cell viewWithTag:1001];
    }

    NSArray *list = [appDelegate.loadingDate copy];
    
    list = [[[list sortedArrayUsingSelector:@selector(compare:)] reverseObjectEnumerator] allObjects]; // 昇順にソート
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *lbl = [dateFormatter stringFromDate:list[indexPath.row]];
    loadDate.text = lbl;
    
    NSInteger u = [UIApplication sharedApplication].applicationIconBadgeNumber;
    if ( indexPath.row < u) {
        NSString *star = [NSString stringWithFormat:@"★"];
        update.text = star;
    } else {
        NSString *star = [NSString stringWithFormat:@""];
        update.text = star;
    }
    
    return cell;
}

@end
