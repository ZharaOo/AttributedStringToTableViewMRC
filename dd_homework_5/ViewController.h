//
//  ViewController.h
//  dd_homework_5
//
//  Created by babi4_97 on 03.11.2017.
//  Copyright © 2017 Ivan Babkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableViewController.h"

@interface ViewController : UIViewController <UITextViewDelegate, ListTableViewControllerDelegate>

@property (retain, nonatomic) IBOutlet UITextView *textView;

@end
