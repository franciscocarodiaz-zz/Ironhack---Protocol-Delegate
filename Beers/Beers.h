//
//  Beers.h
//  Beers
//
//  Created by Francisco Caro Diaz on 13/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "Beer.h"

@interface Beers : Beer

@property (nonatomic, strong) NSMutableArray *beerList;
- (NSMutableArray *) allBeers;

@end
