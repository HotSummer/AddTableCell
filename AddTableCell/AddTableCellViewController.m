//
//  AddTableCellViewController.m
//  AddTableCell
//
//  Created by bangqian zhu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AddTableCellViewController.h"
#import "StyleOneCell.h"
#import "StyleTwoCell.h"
#import "LampLabel.h"
#import <PassKit/PassKit.h>

#define LblWidth 320.0
#define ScrollSpeed 2

@interface AddTableCellViewController ()

@end

@implementation AddTableCellViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    arrOne = [[NSArray alloc] initWithObjects:@"昆山", @"平江", @"吴中", @"工业园区", @"沧浪", nil];
    arrTwo = [[NSArray alloc] initWithObjects:@"昆山酒店", @"平江酒店", @"吴中酒店", @"工业园区酒店", @"沧浪酒店", nil];
    arrShowDetail = [[NSMutableArray alloc] initWithObjects:@"1", @"0", @"0", @"0", @"0", nil];
    iChangeIndex = 0;
    strTest = @"测试1测试2测试3测试4测试5测试6测试7测试8测试9测试10测试11测试12测试13";
//    lblTest.text = strTest;
    CGFloat w = [strTest sizeWithFont:[UIFont fontWithName:@"Arial" size:18]].width;
    LampLabel *lampLabel = [[LampLabel alloc] initWithFrame:CGRectMake(0, 0, w, 40)];
    [lampLabel setBounds:CGRectMake(0, 0, w, 40)];
    lampLabel.lineBreakMode = UILineBreakModeClip;
    lampLabel.text = strTest;
    lampLabel.textAlignment = UITextAlignmentCenter;
    lampLabel.font = [UIFont fontWithName:@"Arial" size:18];
    lampLabel.textColor = [UIColor blackColor];
    lampLabel.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:lampLabel];
    [lampLabel release];
    
    [self initPass];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)initPass{
    BOOL b = [PKPassLibrary isPassLibraryAvailable];
    if (b) {
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"FilightCard" ofType:@"pkpass"];
        
        NSData *data = [[NSData alloc] initWithContentsOfFile:jsonPath];
        PKPass *pass = [[PKPass alloc] initWithData:data error:nil];//[[PKPass alloc] init];//
        PKAddPassesViewController *passVC = [[PKAddPassesViewController alloc] initWithPass:pass];
        [self.navigationController presentViewController:passVC animated:YES completion:^{
            
        }];
        [passVC release];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [arrOne count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([[arrShowDetail objectAtIndex:section] isEqualToString:@"1"]) {
        return 2;
    }else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *cellIndentifier = @"StyleOneCellIndentifier";
        StyleOneCell *styleOneCell = (StyleOneCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (styleOneCell == nil) {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"StyleOneCell" owner:self options:nil];
            for (id nib in nibs) {
                if ([nib isKindOfClass:[StyleOneCell class]]) {
                    styleOneCell = nib;
                }
            }
        }
        styleOneCell.strContent = [arrOne objectAtIndex:indexPath.section];
        return styleOneCell;
    }else if (indexPath.row == 1) {
        static NSString *twoCellIndentifier = @"StyleTwoCellIndentifier";
        StyleTwoCell *styleTwoCell = (StyleTwoCell *)[tableView dequeueReusableCellWithIdentifier:twoCellIndentifier];
        if (styleTwoCell == nil) {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"StyleTwoCell" owner:self options:nil];
            for (id nib in nibs) {
                if ([nib isKindOfClass:[StyleTwoCell class]]) {
                    styleTwoCell = nib;
                }
            }
        }
        styleTwoCell.strDetailContent = [arrTwo objectAtIndex:indexPath.section];
        return styleTwoCell;
    }
    return nil; 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self modifyShowDetailArray:indexPath.section];
    NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] init];
    [indexSet addIndex:indexPath.section];
    [indexSet addIndex:iChangeIndex];
    [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    [indexSet release];
    iChangeIndex = indexPath.section;
}

- (void)modifyShowDetailArray:(NSInteger)index{
    BOOL bAllDisShowDetail = YES;
    for (int i=0; i<[arrShowDetail count]; i++) {
        if ([[arrShowDetail objectAtIndex:i] isEqualToString:@"1"]) {
            bAllDisShowDetail = NO;
            break;
        }
    }
    if (bAllDisShowDetail) {
        [arrShowDetail replaceObjectAtIndex:index withObject:@"1"];
    }else {
        for (int i=0; i<[arrShowDetail count]; i++) {
            if ([[arrShowDetail objectAtIndex:i] isEqualToString:@"1"]) {
                [arrShowDetail replaceObjectAtIndex:i withObject:@"0"];
            }
        }
        if (index != iChangeIndex) {
            [arrShowDetail replaceObjectAtIndex:index withObject:@"1"];
        }
    }
}

- (void)dealloc{
    [arrOne release];
    [arrTwo release];
    [arrShowDetail release];
    [addTableView release];
    [super dealloc];
}

@end
