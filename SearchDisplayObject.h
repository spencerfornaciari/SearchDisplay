//
//  SearchDisplayObject.h
//  SearchDisplay
//
//  Created by Spencer Fornaciari on 4/17/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchDisplayObject : NSObject <UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSMutableArray *myArray;
@property (nonatomic) UINib *myNib;
           

@end
