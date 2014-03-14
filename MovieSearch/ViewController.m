//
//  ViewController.m
//  MovieSearch
//
//  Created by Bryan Cimo on 3/13/14.
//  Copyright (c) 2014 Bryan Cimo. All rights reserved.
//

#import "ViewController.h"
#import "MovieData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)PresseedSearchButton:(id)sender
{
	MovieData *moviedata = [MovieData sharedManager];
	if ([_searchTextField.text length] > 0) {
		[moviedata FindMovie:_searchTextField.text];
	}
}

@end
