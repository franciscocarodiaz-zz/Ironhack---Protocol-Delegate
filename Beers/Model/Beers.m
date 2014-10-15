//
//  Beers.m
//  Beers
//
//  Created by Francisco Caro Diaz on 13/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "Beers.h"

@implementation Beers

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSMutableArray *) allBeers{
    return self.beerList;
}

- (void) addBeer:(Beer *)beer{
    [self.beerList addObject:beer];
}

// lazy instantiation getter
- (NSMutableArray *)beerList{
    if(_beerList == nil){
        _beerList = [[NSMutableArray alloc] init];
        [self createBeerList];
    }
    return _beerList;
}

- (void) createBeerList{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"beerList" ofType:@"plist"];
    
    NSArray *userList = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSDictionary *d in userList) {
        Beer *b = [[Beer alloc] init];
        b.name  = [d objectForKey:@"name"];
        b.country_of_origin  = [d objectForKey:@"country_of_origin"];
        b.alcoholic_grade  = [[d objectForKey:@"alcoholic_grade"] intValue];
        b.url_to_photo  = [d objectForKey:@"url_to_photo"];
        [result addObject:b];
    }
    
    [self setBeerList:result];
}

@end
