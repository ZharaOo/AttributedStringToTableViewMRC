//
//  ListTableViewController.h
//  dd_homework_5
//
//  Created by babi4_97 on 04.11.2017.
//  Copyright © 2017 Ivan Babkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListTableViewControllerDelegate <NSObject>
- (void)removeAttributeOfSubstring:(NSRange)range;
@end

@interface ListTableViewController : UITableViewController
@property (nonatomic, assign) id <ListTableViewControllerDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

