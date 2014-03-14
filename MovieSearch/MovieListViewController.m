//
//  MovieListViewController.m
//  MovieSearch
//
//  Created by Bryan Cimo on 3/13/14.
//  Copyright (c) 2014 Bryan Cimo. All rights reserved.
//

#import "MovieListViewController.h"

#import "MovieData.h"

@interface MovieListViewController ()

@end

@implementation MovieListViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.

	_carousel.type = iCarouselTypeCoverFlow2;
    
    if ([[MovieData sharedManager].movieArray count] == 0) {
        _noneFoundLabel.hidden = NO;
    } else {
        _noneFoundLabel.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - === iCarousel methods === -


- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
	return [[MovieData sharedManager].movieArray count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UILabel *label = nil;
	UILabel *label2 = nil;
	MovieData *moviedata = [MovieData sharedManager];

#define IMAGE_VIEW_TAG 99

	//create new view if no view is available for recycling
	if (view == nil) {
		view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250.0f, 500.0f)];
		((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
		view.contentMode = UIViewContentModeCenter;

		label = [[UILabel alloc] initWithFrame:CGRectMake(30, 270, 250, 20)];
		label.backgroundColor = [UIColor clearColor];
		label.font = [label.font fontWithSize:12];
		label.tag = 1;

		label2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 290, 250, 20)];
		label2.backgroundColor = [UIColor clearColor];
		label2.font = [label.font fontWithSize:12];
		label2.tag = 2;

		AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(30.0f, 160.0f, 100.0f, 100.0f)];
		imageView.contentMode = UIViewContentModeScaleAspectFill;
		imageView.clipsToBounds = YES;
		imageView.tag = IMAGE_VIEW_TAG;

		[view addSubview:imageView];
		[view addSubview:label];
		[view addSubview:label2];
	}
	else {
		//get a reference to the label in the recycled view
		label = (UILabel *)[view viewWithTag:1];
		label2 = (UILabel *)[view viewWithTag:2];
	}

	//get image view
	AsyncImageView *imageView = (AsyncImageView *)[view viewWithTag:IMAGE_VIEW_TAG];

	//cancel loading previous image for cell
	[[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];

	//load the image
	DLog(@"%@", [[moviedata.movieArray objectAtIndex:index] objectForKey:@"artworkUrl100"]);
	imageView.imageURL = [NSURL URLWithString:[[moviedata.movieArray objectAtIndex:index] objectForKey:@"artworkUrl100"]];

	label.text = [[moviedata.movieArray objectAtIndex:index] objectForKey:@"trackName"];
	label2.text = [NSString stringWithFormat:@"Rated: %@", [[moviedata.movieArray objectAtIndex:index] objectForKey:@"contentAdvisoryRating"]];

	return view;
}

- (UIColor *)randomColor
{
	float red, green, blue;

	red = arc4random_uniform(255);
	green = arc4random_uniform(255);
	blue = arc4random_uniform(255);

	UIColor *colorToReturn = [[UIColor alloc] initWithRed:red / 255 green:green / 255 blue:blue / 255 alpha:1];

	return colorToReturn;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
	return value;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
	NSLog(@"Tapped view number: %d", index);
	MovieData *moviedata = [MovieData sharedManager];
	moviedata.selectedMovie = index;

	[self performSegueWithIdentifier:@"MoviePlayerSegue" sender:self];
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
}

@end
