//
//  PTAppDelegate.m
//  V=IReader
//
//  Created by Rob King on 1/11/12.
//  Copyright (c) 2012 University of Maine. All rights reserved.
//

#import "PTAppDelegate.h"

#import "PTMasterViewController.h"

#import "PTDetailViewController.h"

@implementation PTAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize splitViewController = _splitViewController;

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [_splitViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
   
    // Override point for customization after application launch.
    UIColor* navBarColor = [UIColor colorWithRed: (57.0 / 255.0) green: (62.0 / 255.0) blue: (64.0 / 255.0) alpha: 1.0f];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        PTMasterViewController *masterViewController = [[[PTMasterViewController alloc] initWithNibName:@"PTMasterViewController_iPhone" bundle:nil] autorelease];
        self.navigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
        [self.navigationController.navigationBar setTintColor: navBarColor];
        
        self.window.rootViewController = self.navigationController;
    } else {
        // Set up the master view controller
        PTMasterViewController *masterViewController = [[[PTMasterViewController alloc] initWithNibName:@"PTMasterViewController_iPad" bundle:nil] autorelease];
        UINavigationController *masterNavigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
        [masterNavigationController.navigationBar setTintColor: navBarColor];
        
        // Set up the detail view controller
        PTDetailViewController *detailViewController = [[[PTDetailViewController alloc] initWithNibName:@"PTDetailViewController_iPad" bundle:nil] autorelease];
        UINavigationController *detailNavigationController = [[[UINavigationController alloc] initWithRootViewController:detailViewController] autorelease];
    	 [detailNavigationController.navigationBar setTintColor: navBarColor];
        
        // Assign this detail view controller to the master view controller property so it will update the interface
        [masterViewController setDetailViewController: detailViewController];
        
        self.splitViewController = [[[UISplitViewController alloc] init] autorelease];
        self.splitViewController.delegate = detailViewController;
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:masterNavigationController, detailNavigationController, nil];
        
        self.window.rootViewController = self.splitViewController;
    }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
