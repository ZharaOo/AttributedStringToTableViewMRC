//
//  RangeString.m
//  dd_homework_5
//
//  Created by babi4_97 on 04.11.2017.
//  Copyright © 2017 Ivan Babkin. All rights reserved.
//

#import "RangeString.h"

@implementation RangeString

- (id)initWithAttributedString:(NSAttributedString *)strParam range:(NSRange)rangeParam {
    [strParam retain];
    self = [super init];
    if (self) {
        _string = [strParam copy];
        _range = rangeParam;
    }
    [strParam release];
    return self;
}

- (void)dealloc {
    [_string release];
    [super dealloc];
}

@end
