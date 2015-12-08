//
//  MovieDetailsViewController.m
//  MovieSearch
//
//  Created by Bryan Cimo on 3/13/14.
//  Copyright (c) 2014 Bryan Cimo. All rights reserved.
//

#import "MovieDetailsViewController.h"

@interface MovieDetailsViewController ()

@end

@implementation MovieDetailsViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.

	MovieData *moviedata = [MovieData sharedManager];

	NSDictionary *movieDict = [moviedata.movieArray objectAtIndex:moviedata.selectedMovie];

	NSString *movieurl = [movieDict objectForKey:@"artworkUrl100"];
	[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:movieurl]]];

	DLog(@"date: %@", [movieDict objectForKey:@"releaseDate"]);

	NSDateFormatter *f = [[NSDateFormatter alloc] init];
	[f setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
	NSDate *date = [f dateFromString:[movieDict objectForKey:@"releaseDate"]];
	DLog(@"1: %@", [f stringFromDate:date]);

	NSDateFormatter *f2 = [[NSDateFormatter alloc] init];
	[f2 setDateFormat:@"MM/dd/y"];
	[f2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	NSString *dateString = [f2 stringFromDate:date];
	self.releaseDate.text = [NSString stringWithFormat:@"Released: %@", dateString];

	self.price.text = [NSString stringWithFormat:@"$%@", [[movieDict objectForKey:@"collectionPrice"] stringValue]];
	self.description2.text = [movieDict objectForKey:@"longDescription"];

	self.rating.text = [NSString stringWithFormat:@"Rated: %@", [movieDict objectForKey:@"contentAdvisoryRating"]];
	self.movieTitle.text = [movieDict objectForKey:@"trackName"];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (IBAction)PressedDone:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)PressedPlay:(id)sender
{
	MovieData *moviedata = [MovieData sharedManager];
	NSString *movieurl = [[moviedata.movieArray objectAtIndex:moviedata.selectedMovie] objectForKey:@"previewUrl"];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:movieurl]];
}

- (IBAction)PressedBuy:(id)sender
{
	MovieData *moviedata = [MovieData sharedManager];
	NSString *movieurl = [[moviedata.movieArray objectAtIndex:moviedata.selectedMovie] objectForKey:@"trackViewUrl"];
	DLog(@"%@", movieurl);
	[movieurl stringByReplacingOccurrencesOfString:@"https" withString:@"itms"];
	DLog(@"%@", movieurl);

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:movieurl]];
}

@end
