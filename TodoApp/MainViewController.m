//
//  MainViewController.m
//  TodoApp
//
//  Created by Mike Madick on 8/12/13.
//  Copyright (c) 2013 Mike Madick. All rights reserved.
//

#import "MainViewController.h"
#import "TodoCell.h"

@interface MainViewController ()


@end

@implementation MainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Todo List";
    }
    
    
//    self.todoCellArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    self.todoTextArray = [[NSMutableArray alloc]initWithCapacity:0];
//    [self.testArray addObject:@"one"];
//    [self.testArray addObject:@"two"];
//    for(NSString *item in self.testArray)
//    {
//        NSLog(@"Found an Item: %@",item);
//    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UINib *customNib = [UINib nibWithNibName:@"TodoCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"TodoCell"];
    
    // Create and initialize a tap gesture
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(respondToTapGesture:)];
    
    // Specify that the gesture must be a single tap
    tapRecognizer.numberOfTapsRequired = 1;
    
    // Add the tap gesture recognizer to the view
    [self.view addGestureRecognizer:tapRecognizer];
    
    // Add nav buttons
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
                                              
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonSystemItemEdit target:self action:@selector(editItem)];
    
                                              
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)addItem {
    NSLog(@"in add Item");
    
    [self.todoTextArray addObject:@""];
    
//    TodoCell *cell = [[TodoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TodoCell"];
//    
//    cell.todoTextField.text = @"type something2";
//    [self.todoCellArray addObject:cell];
    
//    for(TodoCell *item in self.todoCellArray)
//    {
//        NSLog(@"Found an Item: %@",item.todoTextField.text);
//    }
    
    [self.tableView reloadData];
    
}
- (IBAction)editItem {
    NSLog(@"in edit Item");
    [self.tableView setEditing:YES];
}

- (IBAction)respondToTapGesture:(UITapGestureRecognizer *)tapRecognizer {
    // Get the location of the gesture
//    CGPoint location = [recognizer locationInView:self.view];
    NSLog(@"respondToTapGesture");
    
    
    [self.view endEditing:YES];
    [self.tableView setEditing:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.todoCellArray count];
    return [self.todoTextArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // http://stackoverflow.com/questions/8079471/how-does-cellforrowatindexpath-work
    NSLog(@"in cellForRowAtIndexPath: row: %d",indexPath.row);
//    TodoCell *cell1 = [self.todoCellArray objectAtIndex:indexPath.row];
//    NSLog(@"cell1: %@",cell1.todoTextField.text);
    
//    static NSString *CellIdentifier = @"TodoCell";
//    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];

    // Tried with array of tablecells, but could not get text to display
    // set text to what is my array
//    cell = [self.todoCellArray objectAtIndex:indexPath.row];
    cell.todoTextField.text = [self.todoTextArray objectAtIndex:indexPath.row];
    cell.todoTextField.tag = indexPath.row;
    
    // need to make main view controller delegate for cell text field
    cell.todoTextField.delegate = self;
    
    
//    return [self.todoCellArray objectAtIndex:indexPath];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// http://developer.apple.com/library/ios/documentation/userexperience/conceptual/tableview_iphone/ManageReorderRow/ManageReorderRow.html
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *stringToMove = [self.todoTextArray objectAtIndex:fromIndexPath.row];
    [self.todoTextArray removeObjectAtIndex:fromIndexPath.row];
    [self.todoTextArray insertObject:stringToMove atIndex:toIndexPath.row];

}

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath %d",indexPath.row);
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - UITextField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing: %d", textField.tag);
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFielDidEndEditing: %d", textField.tag);
    [self.todoTextArray replaceObjectAtIndex:textField.tag withObject:textField.text];
    
}

@end
