//
//  PBWebDiffController.m
//  GitX
//
//  Created by Pieter de Bie on 13-10-08.
//  Copyright 2008 Pieter de Bie. All rights reserved.
//

#import "PBWebDiffController.h"


@implementation PBWebDiffController

- (void) awakeFromNib
{
	startFile = @"simpleDiff";
	[super awakeFromNib];
	[diffController addObserver:self forKeyPath:@"diff" options:0 context:@"ChangedDiff"];
}

- (void) didLoad
{
	[self showDiff:diffController.diff];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(NSString *)context
{
    if ([context isEqualToString: @"ChangedDiff"])
		[self showDiff:diffController.diff];
}

- (void) showDiff: (NSString *) diff
{
	if (diff == nil || !finishedLoading)
		return;

	id script = [view windowScriptObject];
	[script callWebScriptMethod:@"showDiff" withArguments: [NSArray arrayWithObject:diff]];
}

@end