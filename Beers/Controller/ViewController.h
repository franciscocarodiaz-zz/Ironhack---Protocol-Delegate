//
//  ViewController.h
//  Beers
//
//  Created by Francisco Caro Diaz on 13/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "Beers.h"

// or reference declaration -> @protocol EditBeerDelegate

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,EditBeerDelegate>

// model object
@property (nonatomic, strong) NSMutableArray *theBeers;

@end

