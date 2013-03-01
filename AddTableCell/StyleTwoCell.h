//
//  StyleTwoCell.h
//  AddTableCell
//
//  Created by bangqian zhu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StyleTwoCell : UITableViewCell{
    NSString *strDetailContent;
    IBOutlet UILabel *lblDetailContent;
}
@property(nonatomic, retain) NSString *strDetailContent;

@end
