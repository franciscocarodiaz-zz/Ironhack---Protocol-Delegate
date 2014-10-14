//
//  BeersTests.m
//  BeersTests
//
//  Created by Francisco Caro Diaz on 13/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Beer.h"
#import "Beers.h"
#define DEFAULT_NAME @"Pepe"
#define DEFAULT_INT 0.00
#define ACCURACY 0.01

@interface BeersTests : XCTestCase

@end

@implementation BeersTests

// 0. test the behavior of this Beer
- (void) testBeerInit{
    Beer *b = [[Beer alloc] initWithName:DEFAULT_NAME];
    XCTAssert(b != nil);
}

// 1. test the behavior of this Beer class adding name
- (void) testtestBeerInitWithNameReturnsEqualName{
    NSString *name = DEFAULT_NAME;
    NSString *country_of_origin = DEFAULT_NAME;
    CGFloat alcoholic_grade = DEFAULT_INT;
    NSString *url_to_photo = DEFAULT_NAME;
    
    NSString *result = DEFAULT_NAME;
    
    Beer *b = [[Beer alloc] initWithName:name andCountryOfOrigin:country_of_origin andAlcoholicGrade:alcoholic_grade urlToPhoto:url_to_photo];
    XCTAssertEqualObjects(result, [b name]);
}

// 2. test the behavior of Beers Class
- (void) testBeersInit{
    Beers *bs = [[Beers alloc] init];
    XCTAssert(bs != nil);
}

- (void) testBeersInitWithBeer{
    Beers *bs = [[Beers alloc] init];
    
    
    Beer *b = [[Beer alloc] initWithName:DEFAULT_NAME];
    [bs.beerList addObject:b];
    
    XCTAssert(bs.beerList != nil);
}


- (void) testBeersInitWithUserList{
    Beers *bs = [[Beers alloc] init];
    XCTAssert([bs.beerList count] > 0);
    XCTAssert(bs.beerList != nil);
}


- (void) testBeersInitWithBeerResultOneBeerCreated{
    Beers *bsAux = [[Beers alloc] init];
    Beers *bs = [[Beers alloc] init];
    
    NSString *name = DEFAULT_NAME;
    NSString *country_of_origin = DEFAULT_NAME;
    CGFloat alcoholic_grade = DEFAULT_INT;
    NSString *url_to_photo = DEFAULT_NAME;
    
    Beer *b = [[Beer alloc] initWithName:name andCountryOfOrigin:country_of_origin andAlcoholicGrade:alcoholic_grade urlToPhoto:url_to_photo];
    [bs.beerList addObject:b];
    
    XCTAssert(bs.beerList.count == bsAux.beerList.count+1);
}

- (void) testBeerInitWithBeerAlc1{
    Beers *bs = [[Beers alloc] init];
    
    
    Beer *b = [[Beer alloc] initWithName:DEFAULT_NAME andCountryOfOrigin:DEFAULT_NAME andAlcoholicGrade:DEFAULT_INT urlToPhoto:DEFAULT_NAME];
    [bs.beerList addObject:b];
    
    XCTAssert(bs.beerList != nil);
    
    CGFloat result = 0.0;
    XCTAssertEqualWithAccuracy(result, b.alcoholic_grade, ACCURACY);
}



@end
