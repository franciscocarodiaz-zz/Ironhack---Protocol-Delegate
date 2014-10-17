#import "Beer.h"
#define EMPTY_VALUE @"ironHack"
#define EMPTY_INT_VALUE 0.00

@implementation Beer

+(Beer *)beerWithName:(NSString *)name{
    return [[Beer alloc] initWithName:name];
}
+(Beer *)beer{
    return [self beerWithName:@"sdfsdfs"];
}

- (void) initBeer{
    [self setName:EMPTY_VALUE];
}

- (instancetype)init{
    // Need to instante the super first
    self = [self initWithName:EMPTY_VALUE andCountryOfOrigin:EMPTY_VALUE andAlcoholicGrade:EMPTY_INT_VALUE urlToPhoto:EMPTY_VALUE];
    return self;
}


- (instancetype)initWithName:(NSString *)name
{
    self = [self initWithName:name andCountryOfOrigin:EMPTY_VALUE andAlcoholicGrade:EMPTY_INT_VALUE urlToPhoto:EMPTY_VALUE];
    return self;
}

- (instancetype)initWithName:(NSString *)name andCountryOfOrigin:(NSString *)country_of_origin{
    self = [self initWithName:name andCountryOfOrigin:country_of_origin andAlcoholicGrade:EMPTY_INT_VALUE urlToPhoto:EMPTY_VALUE];
    return self;
}

- (instancetype)initWithName:(NSString *)name andCountryOfOrigin:(NSString *)country_of_origin andAlcoholicGrade:(CGFloat)alcoholic_grade{
    self = [self initWithName:name andCountryOfOrigin:country_of_origin andAlcoholicGrade:alcoholic_grade urlToPhoto:EMPTY_VALUE];
    return self;
}

// designated initializer
-(instancetype)initWithName:(NSString *)name andCountryOfOrigin:(NSString *)country_of_origin andAlcoholicGrade:(CGFloat)alcoholic_grade urlToPhoto:(NSString *)url_to_photo{
    self = [super init];
    if (self) {
        _name = name;
        _country_of_origin = country_of_origin;
        _alcoholic_grade = alcoholic_grade;
        _url_to_photo = url_to_photo;
    }
    return self;
}

- (void) prettyPrint{
    NSLog(@"Name: %@\ncountry of origin: %@\nalcoholic grade: %f\nurl to photo: %@\n",self.name,self.country_of_origin,self.alcoholic_grade, self.url_to_photo);
}

@end
