//
//  StyleOneCell.h
//  AddTableCell
//
//  Created by bangqian zhu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StyleOneCell : UITableViewCell{
    IBOutlet UILabel *lblContent;
    NSString *strContent;
}
@property(nonatomic, retain) NSString *strContent;

@end
