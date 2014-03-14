//
//  MovieData.h
//  MovieSearch
//
//  Created by Bryan Cimo on 3/13/14.
//  Copyright (c) 2014 Bryan Cimo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MovieData : NSObject
{
	NSArray *movieArray;
	NSInteger selectedMovie;
}

@property (nonatomic, strong) NSArray *movieArray;
@property (nonatomic, assign) NSInteger selectedMovie;

- (BOOL)FindMovie:(NSString *)movieName;
+ (instancetype)sharedManager;

@end
