//
//  ViewController.m
//  Beers
//
//  Created by Francisco Caro Diaz on 13/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+UrlImage.h"
#define NUMBER_OF_SECTIONS 1

@interface ViewController ()

//@property (nonatomic,weak) IBOutlet UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning REMEMBER TO CLEAN THIS CORPSE
    Beers *beers = [[Beers alloc] init];
    self.theBeers = [beers allBeers];
    
    //self.title = @"Duff Land";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor brownColor];
    self.navigationController.navigationBar.barTintColor = [UIColor brownColor];
    
    //[self addBeerButtonToNavigationBar];
}

/*
- (void) addBeerButtonToNavigationBar{
    UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addNewBeerButtonPressed)];
    [self.navigationItem setRightBarButtonItem:b];
}
*/

- (void) addNewBeerButtonPressed{
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.theBeers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"section: %ld, row: %ld",(long)indexPath.section, (long)indexPath.row);
    /*
    UITableViewCell *cell;
    // try to extract the info from the buffer
    cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mycell"];
    }
    [cell setBackgroundColor:[UIColor clearColor]];
    [[cell backgroundView] setBackgroundColor:[UIColor brownColor]];
    */
    
    BeerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BeerCell"];
    
    NSString *cellTitleText;
    NSString *cellDetailText;
    NSString *cellImage;
    
    Beer *currentBeer = [self.theBeers objectAtIndex:indexPath.row];
    cellTitleText = [currentBeer.name capitalizedString];
    cellDetailText = [NSString stringWithFormat:@"%@, %.1f%%",[currentBeer.country_of_origin capitalizedString],currentBeer.alcoholic_grade];
    cellImage = currentBeer.url_to_photo;
    
    cell.beer = currentBeer;
    
    // Without using viewcontroller
    /*
    cell.textLabel.text = cellTitleText;
    cell.detailTextLabel.text = cellDetailText;
    //cell.imageView.image = [UIImage imageWithUrlString:currentBeer.url_to_photo];
    */
    
    return cell;
    
    /*
    switch (indexPath.section) {
        case SIMPSONS_SECTION:
            cellText =[self.theSimpsons objectAtIndex:indexPath.row];
            [cell setBackgroundColor:[UIColor yellowColor]];
            break;
        case SW_SECTION:
            cellText =[self.starWars objectAtIndex:indexPath.row];
            [cell setBackgroundColor:[UIColor lightGrayColor]];
            break;
        default: // DO NOTHING
            break;
    }
    */
}

/*

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Beer *currentBeer = self.theBeers[indexPath.row];
    NSLog(@"User touching row: %lu which constains %@", indexPath.row, currentBeer.name);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 2. Move to the DetailViewController
    
    DetailViewController *vc = [[DetailViewController alloc] init];
    //vc.beer = currentBeer;
    [vc setBeer:currentBeer]; // property dependency injection
    vc.delegate = self;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    /* 1. Load Alert view
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Alert"
                                message:@"You have taped on something"
                                preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]; // CLOSURES
    
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
    */
/*
 }
*/


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *title;
    title = @"International Beers";
    return title;
}

#pragma mark - Edit Beer Delegate Methods

-(void)editBeerDidFinish:(Beer *)beer{
    
    //[self.theBeers addObject:beer];
#warning fix side effect and do it right
    
    // Not the most efficient
    [self.tableView reloadData];
}

-(void)addBeerDidFinish:(Beer *)beer{
    [self.theBeers addObject:beer];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"AddBeerSegue"]) {
        [[segue destinationViewController] setDelegate:self];
    }
    if ([[segue identifier] isEqualToString:@"EditBeerSegue"]) {
        DetailViewController *vc = [segue destinationViewController];
        Beer *currentBeer = [self.theBeers objectAtIndex:[self.tableView.indexPathForSelectedRow row]];
        vc.beer = currentBeer;
        vc.delegate = self;
    }
}


@end
