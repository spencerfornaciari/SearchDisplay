//
//  SearchDisplayObject.m
//  SearchDisplay
//
//  Created by Spencer Fornaciari on 4/17/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SearchDisplayObject.h"

@implementation SearchDisplayObject

-(id)init
{
    if (self = [super init]) {
        self.myArray = [NSMutableArray new];
        self.myNib = [UINib nibWithNibName:@"cell" bundle:nil];
       
        
    }
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myArray.count;
}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];]
//    
//    UINib *cellNib = [UINib nibWithNibName:@"CCACustomCell" bundle:nil];
//    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    
//    cell.textLabel.text = self.myArray[indexPath.row];
//    
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.myArray[indexPath.row];
    return cell;
}


@end
