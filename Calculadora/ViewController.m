//
//  ViewController.m
//  Calculadora
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    bool _isFirstNumber;
}

@property (nonatomic, strong) NSMutableArray *numbersArray;
@property (nonatomic, strong) NSMutableArray *operationsArray;



@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)numberTouched:(UIButton *)sender;

- (IBAction)plusTouched:(UIButton *)sender;

- (IBAction)minusTouched:(UIButton *)sender;

- (IBAction)multiplyTouched:(UIButton *)sender;

- (IBAction)dividedTouched:(UIButton *)sender;

- (IBAction)acTouched:(UIButton *)sender;

- (IBAction)equalTouched:(UIButton *)sender;

- (void)calculateResult;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isFirstNumber = true;
    _numbersArray = [[NSMutableArray alloc] init];
    _operationsArray = [[NSMutableArray alloc] init];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)numberTouched:(UIButton*)sender {
    
    if (_resultLabel.text.length >= 16 ) {
        return;
    }
    
    NSString *numberString = sender.titleLabel.text;
    if (_isFirstNumber){
        _resultLabel.text = numberString;
        if (![numberString isEqualToString:@"0"]) {
            _isFirstNumber = false;
        }
    } else {
        _resultLabel.text = [NSString stringWithFormat:@"%@%@",_resultLabel.text, numberString];
    }
}

- (IBAction)plusTouched:(UIButton*)sender{
    _isFirstNumber = true;
    sender.layer.borderWidth = 5;
    sender.layer.borderColor = [[UIColor blackColor] CGColor];
    
    [_numbersArray addObject:_resultLabel.text];
    [_operationsArray addObject:@"+"];
    
    
}

- (IBAction)minusTouched:(UIButton *)sender {
}

- (IBAction)multiplyTouched:(UIButton *)sender {
}

- (IBAction)dividedTouched:(UIButton *)sender {
}

- (IBAction)acTouched:(UIButton *)sender {
    _resultLabel.text = @"0";
    _isFirstNumber = true;
}

- (IBAction)equalTouched:(UIButton *)sender {
    if(_numbersArray.count >=  1){
        [_numbersArray addObject:_resultLabel.text];
        [self calculateResult];
    }
}

- (void)calculateResult {
        
        for(int i=0; i < _operationsArray.count; i++) {
            
            NSString *number1String = _numbersArray[i];
            NSString *number2String = _numbersArray[i+1];
            NSString *operation = _operationsArray[i];
            int number1 = number1String.intValue;
            int number2 = number2String.intValue;
            
            if([operation isEqualToString:@"+"]) {
                int result = number1 + number2;
                _resultLabel.text = [NSString stringWithFormat:@"%d", result];
            }
            
        }
}
    



@end
