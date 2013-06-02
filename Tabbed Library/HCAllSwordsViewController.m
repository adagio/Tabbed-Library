//
//  HCAllSwordsViewController.m
//  Tabbed Library
//
//  Created by Franco Cedillo on 5/26/13.
//  Copyright (c) 2013 HartasCuerdas. All rights reserved.
//

#import "HCAllSwordsViewController.h"

@interface HCAllSwordsViewController ()
@property NSArray *swords;
@end

@implementation HCAllSwordsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        // Set Title
        self.title = @"Swords";
        // Set Tab Bar Item
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
        // Set Badge Value
        [self.tabBarItem setBadgeValue:@"12"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set Title
    self.title = @"Swords";
    // Extract Swords
    self.swords = [self extractSwords];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.swords count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell Identifier";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Fetch Sword
    NSDictionary *sword = [self.swords objectAtIndex:[indexPath row]];
    // Configure cell
    [cell.textLabel setText:[sword objectForKey:@"Title"]];
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

/*
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
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (NSArray *)extractSwords {
    // Buffer
    NSMutableArray *buffer = [[NSMutableArray alloc] init];
    // Load Pirates
    NSString *filePath =  [[NSBundle mainBundle] pathForResource:@"Books" ofType:@"plist"];
    NSArray *pirates = [NSArray arrayWithContentsOfFile:filePath];
    for (int i=0; i < [pirates count]; i++) {
        NSDictionary *pirate = [pirates objectAtIndex:i];
        // Add Sword to Buffer
        [buffer addObjectsFromArray:[pirate objectForKey:@"Books"]];
    }
    // Sort Books Alphabetically
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"Title" ascending:YES];
    NSArray *result = [buffer sortedArrayUsingDescriptors:@[sortDescriptor]];
    return result;
}

@end
