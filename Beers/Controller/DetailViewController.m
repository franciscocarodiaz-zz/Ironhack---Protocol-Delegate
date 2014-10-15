//
//  DetailViewController.m
//  Beers
//
//  Created by Francisco Caro Diaz on 14/10/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "DetailViewController.h"
#define NUM_COLUMN_PICKER 1
#define NUM_ROW_PICKER 101

typedef enum {
    ADDING_BEER = 0,
    EDITING_BEER = 1
} EditingMode;

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *gradePicker;
@property (weak, nonatomic) IBOutlet UITextField *txtBeerName;
@property (nonatomic) EditingMode editingMode;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.editingMode = EDITING_BEER;
    
    self.title = @"Detail (TO-DO)";
}

-(void)viewWillAppear:(BOOL)animated{
    // before appears
    if (!self.beer) {
        self.editingMode = ADDING_BEER;
    }
    
    if (self.editingMode == ADDING_BEER) {
        self.beer = [[Beer alloc] init];
    }
}


-(void)viewDidAppear:(BOOL)animated{
    // Change data after screen appears
    if (self.editingMode == EDITING_BEER) {
        self.txtBeerName.text = self.beer.name;
        [self.gradePicker selectRow:self.beer.alcoholic_grade inComponent:0 animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    
    self.beer.name = self.txtBeerName.text;
    
    if (self.editingMode == EDITING_BEER) {
        // Before that, ask to delegate if there is a method called editBeerDidFinish
        if ([self.delegate respondsToSelector:@selector(editBeerDidFinish:)]) {
            [self.delegate editBeerDidFinish:self.beer];
        }
        
    }else if (self.editingMode == ADDING_BEER){
        if ([self.delegate respondsToSelector:@selector(addBeerDidFinish:)]) {
            [self.delegate addBeerDidFinish:self.beer];
        }
    }
    
}


- (IBAction)touchCancelButton:(id)sender {
    [self backButtonPressed];
}

- (void) backButtonPressed{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Grade Picker View Delegate Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return NUM_COLUMN_PICKER;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return NUM_ROW_PICKER;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *s = [NSString stringWithFormat:@"🍺 %luº ¢",row];
    
    return s;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.beer.alcoholic_grade = row;
}

@end
