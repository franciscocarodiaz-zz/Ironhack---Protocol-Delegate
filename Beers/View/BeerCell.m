//
//  BeerCell.m
//  Beers
//
//  Created by Francisco Caro Diaz on 15/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "BeerCell.h"

@interface BeerCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *beerImage;

@end

@implementation BeerCell

-(void)setBeer:(Beer *)beer{
    _beer = beer;
    //also nice thing
    self.titleLabel.text = beer.name;
    self.detailLabel.text = [NSString stringWithFormat:@"%@, %.1f%%",[beer.country_of_origin capitalizedString],beer.alcoholic_grade];;
    self.beerImage.image = [UIImage imageWithUrlString:beer.url_to_photo];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
