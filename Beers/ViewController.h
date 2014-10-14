//
//  ViewController.h
//  Beers
//
//  Created by Francisco Caro Diaz on 13/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

// model object
@property (nonatomic, strong) NSArray *theBeers;

@end

