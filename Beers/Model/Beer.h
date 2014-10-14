//
//  Beer.h
//  Beers
//
//  Created by Francisco Caro Diaz on 13/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Beer : NSObject

// no thread safe
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *country_of_origin;
@property (nonatomic) CGFloat alcoholic_grade;
@property (nonatomic, strong) NSString *url_to_photo;

- (void) prettyPrint;
- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name andCountryOfOrigin:(NSString *)country_of_origin;
- (instancetype)initWithName:(NSString *)name andCountryOfOrigin:(NSString *)country_of_origin andAlcoholicGrade:(CGFloat)alcoholic_grade;
- (instancetype)initWithName:(NSString *)name andCountryOfOrigin:(NSString *)country_of_origin andAlcoholicGrade:(CGFloat)alcoholic_grade urlToPhoto:(NSString *)url_to_photo;

@end
