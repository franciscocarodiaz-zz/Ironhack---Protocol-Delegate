//
//  ViewController.m
//  Beers
//
//  Created by Francisco Caro Diaz on 13/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "ViewController.h"
#import "Beers.h"
#import "UIImage+UrlImage.h"
#define NUMBER_OF_SECTIONS 1

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.theBeers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"section: %ld, row: %ld",(long)indexPath.section, (long)indexPath.row);
    
    UITableViewCell *cell;
    
    // try to extract the info from the buffer
    cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mycell"];
    }
    [cell setBackgroundColor:[UIColor lightGrayColor]];
    
    
    NSString *cellTitleText;
    NSString *cellDetailText;
    NSString *cellImage;
    
    Beer *currentBeer = [self.theBeers objectAtIndex:indexPath.row];
    cellTitleText = currentBeer.name;
    cellDetailText = [NSString stringWithFormat:@"%@, %f",currentBeer.country_of_origin,currentBeer.alcoholic_grade] ;
    cellImage = currentBeer.url_to_photo;
    
    cell.textLabel.text = cellTitleText;
    cell.detailTextLabel.text = cellDetailText;
    cell.imageView.image = [UIImage imageWithUrlString:currentBeer.url_to_photo];
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Beer *currentBeer = self.theBeers[indexPath.row];
    NSLog(@"User touching row: %lu which constains %@", indexPath.row, currentBeer.name);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Alert"
                                message:@"You have taped on something"
                                preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]; // CLOSURES
    
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *title;
    title = @"International Beers";
    return title;
}


@end
