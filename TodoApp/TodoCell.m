//
//  TodoCell.m
//  TodoApp
//
//  Created by Mike Madick on 8/12/13.
//  Copyright (c) 2013 Mike Madick. All rights reserved.
//

#import "TodoCell.h"

@implementation TodoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSLog(@"initWithStyle");
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    NSLog(@"setSelected");

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UITextField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton)];
    //
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    //    self.navigationItem.rightBarButtonItem = nil;
    NSLog(@"textFieldShouldEndEditing");
    
    return YES;
}

@end
