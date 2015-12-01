//
//  SFManager.m
//  Example
//
//  Created by Sergio Fernández Durán on 10/6/15.
//  Copyright © 2015 Sergio Fernández. All rights reserved.
//

#import "SFManager.h"

#import "SFParser.h"
#import "SFResource.h"

@interface SFManager ()

@property (nonatomic, copy, readwrite) NSArray *resources;

@end

@implementation SFManager

- (void)loadResources
{
    NSMutableArray *resources = [NSMutableArray array];
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"Resources"
                                             withExtension:@"plist"];

    NSArray *resourcesFromPlist = [NSArray arrayWithContentsOfURL:fileURL];

    for (NSDictionary *resourceDictionary in resourcesFromPlist) {
        [resources addObject:[SFParser parseResourceFromDictionary:resourceDictionary]];
    }

    self.resources = resources;
}

@end
