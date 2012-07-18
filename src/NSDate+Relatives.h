//
//  NSDate+Relatives.h
//  NSDate+Relatives
//
//  Copyright (c) 2012 Brett Gibson. 
//  See LICENSE
//

#import <Foundation/Foundation.h>

typedef void (^NSDateAdjustComponentsBlock)(NSDateComponents *components);

@interface NSDate (Relatives)

- (NSDate *)beginningOfDay;
// Sunday indexed
- (NSDate *)beginningOfWeek;
- (NSDate *)beginningOfMonth;
- (NSDate *)beginningOfYear;

- (NSDate *)previousDay;
- (NSDate *)previousWeek;
// THe same day in the previous month, or the last day in the previous month if the previous month
// has fewer days.
- (NSDate *)previousMonth;
// Returns 3/1 of previous year given a leap day
- (NSDate *)previousYear;

- (NSDate *)dateByPreseveringComponents:(NSUInteger)unitFlags;
// block can adjust: year, month, day, hour, second
- (NSDate *)dateByAdjustingComponents:(NSDateAdjustComponentsBlock)adjustments;

@end
