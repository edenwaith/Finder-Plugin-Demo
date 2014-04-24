//
//  AppDelegate.m
//  Finder Plugin Demo
//
//  Created by Chad Armstrong on 4/21/14.
//  Copyright (c) 2014 Edenwaith. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
	// Get Finder's pid
	self.pid = [self finderPID];
	DLog(@"PID: %d", self.pid);
	
	if (self.pid > -1)
	{
		// Add as login item
		// Add to sidebar

	//    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"FinderExt" ofType:@"bundle"];
	//    
	//    NSLog(@"Bundle path: %@", bundlePath);
		
		// Inject plug-in
	}
}

#pragma mark -

/**
 *  Get a list of running applications for the current user and find the pid of the Finder
 *
 *  @return pid of the user's instance of the Finder
 */
- (pid_t) finderPID
{
	NSArray *apps = [NSRunningApplication runningApplicationsWithBundleIdentifier:@"com.apple.finder"];
	
    if ([apps count] < 1)
	{
		DLog(@"Finder not found");
		return -1;
    }
	else
	{
		return [[apps objectAtIndex:0] processIdentifier];
	}
}

@end
