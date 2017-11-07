//
//  RangeString.h
//  dd_homework_5
//
//  Created by babi4_97 on 04.11.2017.
//  Copyright © 2017 Ivan Babkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RangeString : NSString

- (id)initWithAttributedString:(NSAttributedString *)strParam range:(NSRange)rangeParam;

@property (nonatomic, copy) NSAttributedString *string;
@property (nonatomic, assign) NSRange range;

@end
