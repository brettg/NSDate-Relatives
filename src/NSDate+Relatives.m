//
//  NSDate+Relatives.m
//  NSDate+Relatives
//
//  Copyright (c) 2012 Brett Gibson.
//  See LICENSE
//

#import "NSDate+Relatives.h"

const NSUInteger NSCalendarUnitsForAdjusting = NSYearCalendarUnit | NSMonthCalendarUnit |
                                               NSDayCalendarUnit | NSHourCalendarUnit |
                                               NSMinuteCalendarUnit | NSSecondCalendarUnit |
                                               NSWeekdayCalendarUnit |
                                               NSWeekOfYearCalendarUnit;

@implementation NSDate (Relatives)

- (NSDate *)beginningOfDay{
    NSUInteger comps = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    return [self dateByPreseveringComponents:comps];
}
- (NSDate *)beginningOfWeek{
    return [[self dateByAdjustingComponents:^(NSDateComponents *components) {
        components.day -= (components.weekday - 1);
    }] beginningOfDay];
}
- (NSDate *)beginningOfMonth{
    return [self dateByPreseveringComponents:NSYearCalendarUnit | NSMonthCalendarUnit];
}
- (NSDate *)beginningOfYear{
    return [self dateByPreseveringComponents:NSYearCalendarUnit];
}

- (NSDate *)previousDay{
    return [self dateByAdjustingComponents:^(NSDateComponents *components) {
        components.day -= 1;
    }];
}
- (NSDate *)previousWeek{
    return [self dateByAdjustingComponents:^(NSDateComponents *components) {
        components.day -= 7;
    }];
}
- (NSDate *)previousMonth{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *lastOfPrevMonth = [[self beginningOfMonth] previousDay];
    NSInteger daysInPrevMonth = [cal rangeOfUnit:NSDayCalendarUnit
                                          inUnit:NSMonthCalendarUnit
                                         forDate:lastOfPrevMonth].length;

    return [self dateByAdjustingComponents:^(NSDateComponents *components) {
        components.month -= 1;
        components.day = MIN(components.day, daysInPrevMonth);
    }];
}
- (NSDate *)previousYear{
    return [self dateByAdjustingComponents:^(NSDateComponents *components) {
        components.year -= 1;
    }];
}

- (NSDate *)dateByPreseveringComponents:(NSUInteger)unitFlags{
    NSCalendar *cal = [NSCalendar currentCalendar];
    return [cal dateFromComponents:[cal components:unitFlags fromDate:self]];
}

- (NSDate *)dateByAdjustingComponents:(NSDateAdjustComponentsBlock)adjustments{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal components:NSCalendarUnitsForAdjusting fromDate:self];
    adjustments(comps);
    return [cal dateFromComponents:comps];
}

@end
