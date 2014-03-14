//
//  MovieData.m
//  MovieSearch
//
//  Created by Bryan Cimo on 3/13/14.
//  Copyright (c) 2014 Bryan Cimo. All rights reserved.
//

#import "MovieData.h"

@implementation MovieData

@synthesize movieArray;
@synthesize selectedMovie;

- (BOOL)FindMovie:(NSString *)movieName
{
	//get the json and dictionary
	movieArray = [[self dictFromJSONURL:[NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=movie", movieName]] objectForKey:@"results"];

	DLog(@"%@", movieArray);

	return YES;
}

- (NSDictionary *)dictFromJSONURL:(NSString *)urlString
{
	NSString *link = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:link] cachePolicy:0 timeoutInterval:5];
	NSURLResponse *response = nil;
	NSError *error = nil;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

	NSData *convertedJsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
	NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:convertedJsonData options:0 error:nil];

	DLog(@"error: %@", error.description);

	return jsonDict;
}

#pragma mark - === Setup === -

+ (instancetype)sharedManager;
{
	static dispatch_once_t onceQueue;
	static MovieData *MovieData = nil;

	dispatch_once(&onceQueue, ^{ MovieData = [[self alloc] init]; });
	return MovieData;
}

- (id)init
{
	BOOL initSuccessful = NO;
	if (self = [super init]) {
		initSuccessful = YES;
	}
	return initSuccessful ? self : nil;
}

- (id)copyWithZone:(NSZone *)zone

{
	return self;
}

@end
