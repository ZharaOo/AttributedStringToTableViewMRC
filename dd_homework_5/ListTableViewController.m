//
//  ListTableViewController.m
//  dd_homework_5
//
//  Created by babi4_97 on 04.11.2017.
//  Copyright © 2017 Ivan Babkin. All rights reserved.
//

#import "ListTableViewController.h"
#import "RangeString.h"

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView retain];
    [indexPath retain];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    cell.textLabel.numberOfLines = 0;
    RangeString *str = self.dataArray[indexPath.row];
    cell.textLabel.attributedText = str.string;
    [tableView release];
    [indexPath release];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        RangeString *str = self.dataArray[indexPath.row];
        [self.delegate removeAttributeOfSubstring:str.range];
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[[[NSArray alloc] initWithObjects:indexPath, nil] autorelease] withRowAnimation:UITableViewRowAnimationFade];
        [pool drain];
    }
}

- (void)dealloc {
    [_delegate release];
    [_dataArray release];
    [super dealloc];
}
@end

