//
//  PatientsHistoryListVC.m
//  Vaccinations
//
//  Created by Subash Dantuluri on 10/22/13.
//  Copyright (c) 2013 Subash Dantuluri. All rights reserved.
//

#import "PatientsHistoryListVC.h"


//Brian
//Temp fix Nov 01, 2013
#define kGetUrlForVaccinations @"http://localhost/searchVaccination.php"



@interface PatientsHistoryListVC ()

@end

@implementation PatientsHistoryListVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //Subash
    self.navigationItem.title = self.childName;
    NSLog(@"Physician ID in Patient History: %@", _physician_id);
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self runUrlRequest];
}


//Brian
// Temp Fix Nov 01, 2013
-(void) runUrlRequest {
    //Brian
    //Temp fix Nov 01, 2013
    NSURL *url = [NSURL URLWithString:kGetUrlForVaccinations];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    _vaccinations = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"Call from runUrlRequest %@", _vaccinations);
    
    [_myTableView reloadData];
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
    return [_vaccinations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    UILabel* label1 = (UILabel *)[cell viewWithTag:102];
    UILabel* label2 = (UILabel *)[cell viewWithTag:103];
    
    //Brian
    //Temp fix Novv 01, 2013
    NSString* vaccineID = [_vaccinations[indexPath.row] objectForKey:@"vaccine_id"];
    NSString* dateTaken = [_vaccinations[indexPath.row] objectForKey:@"date_taken"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    label1.text = vaccineID;
    label2.text = dateTaken;
    
    return cell;
}
//Subash
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIImageView *checkmark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkmark-green.png"]];
    
    if (cell.accessoryView == nil) {
        cell.accessoryView = checkmark;
    }
    else {
        cell.accessoryView = nil;
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
