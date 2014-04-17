//
//  ViewController.m
//  SearchDisplay
//
//  Created by Spencer Fornaciari on 4/17/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "ViewController.h"
#import "SearchDisplayObject.h"

@interface ViewController ()
{
    UITableView *myTableView;
    NSArray *searchResults;
    SearchDisplayObject *myObject;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    myObject = [SearchDisplayObject new];
    
    self.searchDisplayController.searchResultsDataSource = myObject;
    self.searchDisplayController.searchResultsDelegate = myObject;
    
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    myTableView.hidden = TRUE;
    searchResults = [NSArray arrayWithObjects:@"Bonjour", @"Ciao", @"Pronto", @"Sua Moglie", @"Venero", nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return [searchResults count];
//        
//    } else {
//        return myArray.count;
//    }
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    
//    NSString *string = [searchResults objectAtIndex:indexPath.row];
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        string = [searchResults objectAtIndex:indexPath.row];
//    } else {
//        string = [myArray objectAtIndex:indexPath.row];
//    }
//    
//    return cell;
//}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    
    //    if (self.segmenting.selectedSegmentIndex == 0) {
    //        searchResults = [dataNew.array1 filteredArrayUsingPredicate:resultPredicate];
    //    } else {
    //        searchResults = [dataNew2.array2 filteredArrayUsingPredicate:resultPredicate];
    //    }
    
    myObject.myArray = [[searchResults filteredArrayUsingPredicate:resultPredicate] copy];
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

@end
