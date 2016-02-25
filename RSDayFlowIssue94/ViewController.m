//
//  ViewController.m
//  RSDayFlowIssue94
//
//  Created by Keith Yip on 25/2/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import <RSDayFlow/RSDayFlow.h>

@interface RSDFDatePickerView (Debug)

@property (nonatomic, readonly, strong) RSDFDatePickerCollectionView *collectionView;

@end

@interface ViewController ()
{
    RSDFDatePickerView *mMonthView;
    NSCalendar *mCalendar;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mCalendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dc = [mCalendar components:NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    dc.day = 1;
    dc.month += 6;
    NSDate *selectedDate = [mCalendar dateFromComponents:dc];
    
    mMonthView = [[RSDFDatePickerView alloc] initWithFrame:self.view.bounds calendar:mCalendar];
    mMonthView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    mMonthView.pagingEnabled = YES;
//    mMonthView.delegate = self;
//    mMonthView.dataSource = self;
//    [mMonthView scrollToDate:mDate animated:NO];
    [mMonthView selectDate:selectedDate];
    [self.view addSubview:mMonthView];
    
    NSIndexPath *indexPath = [mMonthView.collectionView indexPathsForSelectedItems].firstObject;
    if (indexPath.section >= mMonthView.collectionView.numberOfSections) {
//        [mMonthView.collectionView layoutAttributesForItemAtIndexPath:indexPath];
        abort();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
