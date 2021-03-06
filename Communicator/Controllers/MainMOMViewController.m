//
//  MainMOMViewController.m
//  Communicator
//
//  Created by mac on 13/06/16.
//  Copyright © 2016 Xanadutec. All rights reserved.
//

#import "MainMOMViewController.h"
#import "Database.h"
#import "Mom.h"
#import "MOMDetailTableViewController.h"
@interface MainMOMViewController ()
@property (strong, nonatomic) UISearchController *searchController;
@property (nonatomic, strong) NSArray *search;
@property(nonatomic, weak) id< UISearchControllerDelegate > delegate;
@property (strong, nonatomic) NSString *indexPath;

@end

@implementation MainMOMViewController
@synthesize search;
@synthesize searchController;
-(void)viewWillAppear:(BOOL)animated
{
    //    self.navigationItem.title = @"New MOM";
    self.tabBarController.navigationItem.title = @"Meeting Minutes";
    self.tabBarController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"SignOut"] style:UIBarButtonItemStylePlain target:self action:@selector(popViewController1)] ;
    [self.navigationItem setHidesBackButton:NO];
    self.tabBarController.navigationItem.rightBarButtonItem=nil;

    // self.navigationController.navigationBar.barTintColor = [UIColor communicatorColor];
    self.tabBarController.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getLatestMOM:) name:NOTIFICATION_GETLATEST_MOM
                                               object:nil];
//        searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//        searchController.searchResultsUpdater = self;
//        searchController.searchBar.delegate = self;
//        self.tableView.tableHeaderView = self.searchController.searchBar;
//        self.definesPresentationContext = YES;
//        self.searchController.obscuresBackgroundDuringPresentation = NO;
//        self.searchController.hidesNavigationBarDuringPresentation=NO;     // default is YES

    Database *db=[Database shareddatabase];
    [db setMOMView];
    [self.tableView reloadData];
        
}

- (void)getLatestMOM:(NSNotification *)notificationData
{
    if ([[notificationData.object objectForKey:@"code"] isEqualToString:SUCCESS])
    {
        Database *db=[Database shareddatabase];
        [db insertLatestRecordsForMOM:notificationData.object];
        [db setMOMView];

        
        //hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        //[hud hideAnimated:YES];
    }
}

-(void)popViewController1
{
    UINavigationController *navController = self.navigationController;
    UIViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginNaviagationController"];
    [navController presentViewController:vc animated:YES completion:nil];
    NSUserDefaults* defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:NULL forKey:@"userObject"];
    [defaults setObject:NULL forKey:@"selectedCompany"];

}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
//    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"feedbackType CONTAINS [cd] %@", self.searchController.searchBar.text];
//    NSArray *predicateResultArray;
//    AppPreferences* app=[AppPreferences sharedAppPreferences];
//    
//    
//    if ([self.searchController.searchBar.text isEqual:@""])
//    {
//        FeedQueryCounter *ft2=[[FeedQueryCounter alloc]init];
//        int i;
//        app.sampleFeedtypeArray=[[NSMutableArray alloc]init];
//        for (i=0; i<app.feedQueryCounterDictsWithTypeArray.count; i++)
//        {
//            ft2= [app.feedQueryCounterDictsWithTypeArray objectAtIndex:i];
//            NSLog(@"%@",ft2.feedbackType);
//            [app.sampleFeedtypeArray insertObject:ft2 atIndex:i];
//            
//            [self.tableView reloadData];
//        }
//    }
//    else
//    {
//        app.sampleFeedtypeArray=[[NSMutableArray alloc]init];
//        predicateResultArray=[[NSMutableArray alloc]init];
//        predicateResultArray =[app.samplefeedTypeCopyForPredicate filteredArrayUsingPredicate:predicate];
//        app.sampleFeedtypeArray=[predicateResultArray mutableCopy];
//        [self.tableView reloadData];
//    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        AppPreferences* app=[AppPreferences sharedAppPreferences];
    //
   
    return app.allMomArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    AppPreferences* app=[AppPreferences sharedAppPreferences];
    UILabel* subjectLabel=(UILabel*)[cell viewWithTag:15];
    UILabel* attendeeLabel=(UILabel*)[cell viewWithTag:12];
    UILabel* dateLabel=(UILabel*)[cell viewWithTag:13];

    NSLog(@"%ld",app.allMomArray.count);
    Mom* momObj= [app.allMomArray objectAtIndex:indexPath.row];
    subjectLabel.text=momObj.subject;
    attendeeLabel.text=[NSString stringWithFormat:@"Attendees: %@",momObj.attendee];
    dateLabel.text=momObj.momDate;
    // UILabel* soNoLabel=(UILabel*)[cell viewWithTag:12];
    // soNoLabel.text=@"So No";
       
    return cell;
    
}

- (IBAction)buttonClicked:(id)sender
{
    UIViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateNewMOMNavigationViewController"];
    
    //[self.navigationController pushViewController:vc animated:YES];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 

    MOMDetailTableViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MOMDetailTableViewController"];
    
    //[self.navigationController pushViewController:vc animated:YES];
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    UILabel* feedbackTypeLabel=(UILabel*)[selectedCell viewWithTag:12];
[self.tabBarController.navigationController pushViewController:vc animated:YES];
//    [self.navigationController presentViewController:vc animated:YES completion:nil];
    vc.selectedRow=indexPath.row;



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
