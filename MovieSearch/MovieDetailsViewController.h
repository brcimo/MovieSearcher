//
//  MovieDetailsViewController.h
//  MovieSearch
//
//  Created by Bryan Cimo on 3/13/14.
//  Copyright (c) 2014 Bryan Cimo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieData.h"


@interface MovieDetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UITextView *description;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *releaseDate;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;

- (IBAction)PressedDone:(id)sender;
- (IBAction)PressedPlay:(id)sender;
- (IBAction)PressedBuy:(id)sender;

@end
