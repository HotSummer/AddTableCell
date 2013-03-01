//
//  AddTableCellViewController.h
//  AddTableCell
//
//  Created by bangqian zhu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTableCellViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate
>{
    IBOutlet UITableView *addTableView;
    
    NSArray *arrOne;
    NSArray *arrTwo;
    NSMutableArray *arrShowDetail;
    NSInteger iChangeIndex;
    NSString *strTest;
}

- (void)modifyShowDetailArray:(NSInteger)index;
- (void)initPass;

@end
