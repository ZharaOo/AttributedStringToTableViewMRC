//
//  ViewController.m
//  dd_homework_5
//
//  Created by babi4_97 on 03.11.2017.
//  Copyright © 2017 Ivan Babkin. All rights reserved.
//

#import "ViewController.h"
#import "RangeString.h"
#import "ListTableViewController.h"

@interface ViewController() <ListTableViewControllerDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)changeTextColor:(UIButton *)sender {
    if ([self.textView selectedRange].length == 0) {
        [self.textView setTextColor:sender.currentTitleColor];
    } else {
        [self.textView.textStorage addAttribute:NSForegroundColorAttributeName value:sender.currentTitleColor range:[self.textView selectedRange]];
    }
}

- (IBAction)clearTextAttributes:(id)sender {
    if ([self.textView selectedRange].length == 0) {
        [self.textView.textStorage removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, self.textView.text.length)];
    } else {
        [self.textView.textStorage removeAttribute:NSForegroundColorAttributeName range:[self.textView selectedRange]];
    }
}

- (void)removeAttributeOfSubstring:(NSRange)range {
    [self.textView.textStorage removeAttribute:NSForegroundColorAttributeName range:range];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"seeListSegue"]) {
        ListTableViewController *dvc = (ListTableViewController *)segue.destinationViewController;
        dvc.dataArray = [self getListOfAttributedStrings:self.textView.textStorage];
        dvc.delegate = self;
    }
}

- (NSMutableArray *)getListOfAttributedStrings:(NSTextStorage *)textStorage {
    [textStorage retain];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [textStorage enumerateAttribute:NSForegroundColorAttributeName
                            inRange:NSMakeRange(0, self.textView.text.length)
                            options:NSAttributedStringEnumerationReverse
                         usingBlock:^void(id value, NSRange range, BOOL *stop){
                             if (value) {
                                 RangeString *str = [[RangeString alloc] initWithAttributedString:[textStorage attributedSubstringFromRange:range] range:range];
                                 [arr addObject:str];
                                 [str release];
                             }
                         }];
    [textStorage release];
    return [arr autorelease];
}

- (void)dealloc {
    [super dealloc];
}

@end

