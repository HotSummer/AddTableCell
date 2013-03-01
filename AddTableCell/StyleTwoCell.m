//
//  StyleTwoCell.m
//  AddTableCell
//
//  Created by bangqian zhu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "StyleTwoCell.h"

@implementation StyleTwoCell
@synthesize strDetailContent;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)setStrDetailContent:(NSString *)strDetailContentParameter{
    strDetailContent = strDetailContentParameter;
    lblDetailContent.text = strDetailContent;
}

- (void)dealloc{
    [lblDetailContent release];
    [super dealloc];
}

@end
