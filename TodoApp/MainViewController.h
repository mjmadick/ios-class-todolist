//
//  MainViewController.h
//  TodoApp
//
//  Created by Mike Madick on 8/12/13.
//  Copyright (c) 2013 Mike Madick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

//@property(nonatomic,strong) NSMutableArray *todoCellArray;
@property(nonatomic,strong) NSMutableArray *todoTextArray;

@end
