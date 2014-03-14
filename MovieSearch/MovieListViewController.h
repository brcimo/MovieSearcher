//
//  MovieListViewController.h
//  MovieSearch
//
//  Created by Bryan Cimo on 3/13/14.
//  Copyright (c) 2014 Bryan Cimo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "AsyncImageView.h"

@interface MovieListViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>
{
	NSTimer *timer;
}

@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UILabel *noneFoundLabel;

@end
