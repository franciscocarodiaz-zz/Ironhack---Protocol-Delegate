//
//  DetailViewController.h
//  Beers
//
//  Created by Francisco Caro Diaz on 14/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"

// import in .m and declare: @class Beer

@protocol EditBeerDelegate <NSObject>

@optional
- (void) editBeerDidFinish:(Beer *)beer;
- (void) addBeerDidFinish:(Beer *)beer;

//@required

@end

@interface DetailViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

// model object
@property (nonatomic, strong) Beer *beer;
@property (nonatomic, weak) id<EditBeerDelegate> delegate;

@end
