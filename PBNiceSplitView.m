//
//  PBNiceSplitView.m
//  GitX
//
//  Created by Pieter de Bie on 31-10-08.
//  Copyright 2008 Pieter de Bie. All rights reserved.
//

#import "PBNiceSplitView.h"

static NSImage *verticalBar;
static NSImage *gripVertical;

static NSImage *horizontalBar;
static NSImage *gripHorizontal;

@implementation PBNiceSplitView

+(void) initialize
{
	NSString *hBarPath = [[NSBundle mainBundle] pathForResource:@"mainSplitterBar" ofType:@"tiff"];
	horizontalBar = [[NSImage alloc] initWithContentsOfFile: hBarPath];
	[horizontalBar setFlipped: YES];
	
	NSString *vBarPath = [[NSBundle mainBundle] pathForResource:@"mainSplitterBarVertical" ofType:@"tiff"];
	verticalBar = [[NSImage alloc] initWithContentsOfFile: vBarPath];
	[verticalBar setFlipped: YES];
	
	NSString *hGripPath = [[NSBundle mainBundle] pathForResource:@"mainSplitterDimple" ofType:@"tiff"];
	gripHorizontal = [[NSImage alloc] initWithContentsOfFile: hGripPath];
	[gripHorizontal setFlipped: YES];

	NSString *vGripPath = [[NSBundle mainBundle] pathForResource:@"mainSplitterDimpleVertical" ofType:@"tiff"];
	gripVertical = [[NSImage alloc] initWithContentsOfFile: vGripPath];
	[gripVertical setFlipped: YES];	
}

- (void)drawDividerInRect:(NSRect)aRect
{
	
	[self lockFocus];
	
	if( [self isVertical] ) {
		// Draw bar and grip onto the canvas
		NSRect gripRect = aRect;
		
		gripRect.origin.y = (NSMidY(aRect) - ([gripVertical size].height/2));
		gripRect.size.height = 8;
		
		[verticalBar drawInRect:aRect fromRect:NSZeroRect operation:NSCompositeCopy fraction:1.0];
		[gripVertical drawInRect:gripRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
	} else {
		// Draw bar and grip onto the canvas
		NSRect gripRect = aRect;
		
		gripRect.origin.x = (NSMidX(aRect) - ([gripHorizontal size].width/2));
		gripRect.size.width = 8;

		[horizontalBar drawInRect:aRect fromRect:NSZeroRect operation:NSCompositeCopy fraction:1.0];
		[gripHorizontal drawInRect:gripRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
	}
	
	[self unlockFocus];
}

- (CGFloat)dividerThickness
{
	return 10.0;
}

@end
