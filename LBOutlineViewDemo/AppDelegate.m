//
//  AppDelegate.m
//  LBOutlineViewDemo
//
//  Created by Luther Baker on 11/4/14.
//  Copyright (c) 2014 Luther Baker. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <NSOutlineViewDataSource, NSOutlineViewDelegate>

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
