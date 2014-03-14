//
//  ViewController.h
//  MovieSearch
//
//  Created by Bryan Cimo on 3/13/14.
//  Copyright (c) 2014 Bryan Cimo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *searchTextField;

- (IBAction)PresseedSearchButton:(id)sender;

@end
