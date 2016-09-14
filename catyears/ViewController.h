//
//  ViewController.h
//  catyears
//
//  Created by Student P_07 on 09/09/16.
//  Copyright © 2016 gunchai. All rights reserved.
//
#define kAllUIElementHeight 70.0
#define kVerticalPadding 50.0
#define kHorizontalPadding 30.0

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
CGFloat screenWidth;
CGFloat screenHeight;
CGFloat textFieldWidth;
CGFloat catYearsButtonYCoordinate;
    CGFloat displayLabelYCoordinate;
UILabel *displayLabel;
UITextField *myTextField;
    UIButton *clearButton;
}


@end

