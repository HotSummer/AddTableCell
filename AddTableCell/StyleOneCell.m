//
//  StyleOneCell.m
//  AddTableCell
//
//  Created by bangqian zhu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "StyleOneCell.h"

@implementation StyleOneCell
@synthesize strContent;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (int)retuenTest{
    return 10;
}

- (void)setStrContent:(NSString *)strContentParameter{
    strContent = strContentParameter;
    lblContent.text = strContentParameter;
}

- (void)dealloc{
    [lblContent release];
    [super dealloc];
}

@end
