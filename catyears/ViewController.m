//
//  ViewController.m
//  catyears
//
//  Created by Student P_07 on 09/09/16.
//  Copyright © 2016 gunchai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.view.backgroundColor = [UIColor grayColor];

    screenWidth = [[UIScreen mainScreen]bounds].size.width;
    screenHeight = [[UIScreen mainScreen]bounds].size.height;
    
    textFieldWidth = screenWidth - (2*kHorizontalPadding) - kAllUIElementHeight;

    catYearsButtonYCoordinate = screenHeight-textFieldWidth-(5*kVerticalPadding)-100;

    displayLabelYCoordinate = kVerticalPadding + kAllUIElementHeight + 200;

    myTextField = [[UITextField alloc]initWithFrame:CGRectMake(kHorizontalPadding, 100, screenWidth-(5*kHorizontalPadding), kAllUIElementHeight)];
    [myTextField setBackgroundColor:[UIColor whiteColor]];
    [myTextField setTextColor:[UIColor blackColor]];
    [myTextField setBorderStyle:UITextBorderStyleBezel];
    [myTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [myTextField setFont:[UIFont boldSystemFontOfSize:30]];
     myTextField.delegate = self;
    
    [myTextField setPlaceholder:@"Enter Human Age"];
    myTextField.keyboardType = UIKeyboardTypeNumberPad;
    


    [self.view addSubview:myTextField];

    UIButton *catYearsButton = [[UIButton alloc]initWithFrame:CGRectMake(catYearsButtonYCoordinate, 200, 200, kAllUIElementHeight)];
    
    catYearsButton.backgroundColor = [UIColor orangeColor];
    [catYearsButton setTitle:@"CATYEARS" forState:UIControlStateNormal];
    catYearsButton.layer.cornerRadius = kAllUIElementHeight/2.5;
    
    [catYearsButton addTarget:self action:@selector(handleCatYears) forControlEvents:UIControlEventTouchUpInside];
    
    [catYearsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    catYearsButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [catYearsButton.titleLabel setFont:[UIFont boldSystemFontOfSize:25.f]];

    [[catYearsButton layer] setBorderWidth:2.0f];

    [[catYearsButton layer] setBorderColor:[UIColor greenColor].CGColor];
    [self.view addSubview:catYearsButton];
    
    
    clearButton = [[UIButton alloc]initWithFrame:CGRectMake(screenWidth-(3*kHorizontalPadding), 100, kAllUIElementHeight, kAllUIElementHeight)];
    clearButton.backgroundColor = [UIColor whiteColor];
    [clearButton setTitle:@"CLEAR" forState:UIControlStateNormal];
    [clearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    clearButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [clearButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20.f]];
    clearButton.layer.cornerRadius = kAllUIElementHeight/5;

    [clearButton addTarget:self action:@selector(handleClear) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    [self.view addSubview:clearButton];
    
    displayLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizontalPadding, displayLabelYCoordinate, screenWidth - (2*kHorizontalPadding), kAllUIElementHeight)];
    
    displayLabel.backgroundColor = [UIColor cyanColor];
    
    displayLabel.textColor = [UIColor blackColor];
    displayLabel.textAlignment = NSTextAlignmentCenter;
    [displayLabel setFont:[UIFont boldSystemFontOfSize:20]];
    //displayLabel.layer.cornerRadius = kAllUIElementHeight/1.8;
    displayLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    displayLabel.layer.borderWidth = 2;

    [self.view addSubview:displayLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL) validateTextContent:(NSString *)content
{
    if(content.length>0)
        
    {
        displayLabel.text=content;
        return YES;
    }
    else
    {
        return NO;

    }
    
}
-(void)handleCatYears
{
    BOOL checkInput;
    NSString *inputText;
    inputText=myTextField.text;
   checkInput= [self validateTextContent:inputText];
    
   if (checkInput) {
//        [self displayContent:inputText];
        NSString *currentValueString = myTextField.text;
        
        float currentValueInt = currentValueString.floatValue;
        
        currentValueInt = currentValueInt / 7;
        
        NSString *newValueString = [NSString stringWithFormat:@"%0.1f",currentValueInt];
        
        //myTextField.text=newValueString;
        
        displayLabel.text = newValueString;
      // NSString* displayLabel = @"age %@ ",*newValueString;
       
       //NSLog(@"your age in catyears is: %@",newValueString);
       displayLabel.text = [NSString stringWithFormat: @"Your age in CatYears is:%@",newValueString];

   }
   else {
       displayLabel.text = @"Please Enter years.";
    }

    
    
//
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
   
    
    [textField resignFirstResponder];
    return YES;
}

-(void)handleClear{
    
    myTextField.text = @" ";

}

@end