//
//  AppDelegate.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//  Copyright Voice Technology 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
