//
//  Menu.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "Menu.h"
#import "Vitory.h"
#import "Game.h"

@implementation Menu

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	Menu *layer = [Menu node];
	
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
    if( (self=[super init])) {
    
        
        CCMenuItemImage *start = [CCMenuItemImage itemFromNormalImage:@"botaoStart.GIF" selectedImage:@"botaoStartB.gif" target:self selector:@selector(startGame:)];

        CCMenuItemImage *exit = [CCMenuItemImage itemFromNormalImage:@"botaoExit.GIF" selectedImage:@"botaoExitB.gif" target:self selector:@selector(exitGame:)];

        
        CCMenu *menu = [CCMenu menuWithItems:start,exit, nil];
        
        [menu alignItemsVertically];
        
        [self addChild: menu];
        
    }
    return self;
}


-(void) startGame: (CCMenuItem *) menuItem{
    NSLog(@"start game");
    [[CCDirector sharedDirector] pushScene:[Game scene]];
}

-(void) exitGame: (CCMenuItem *) menuItem{
    NSLog(@"vitory screen");
    [[CCDirector sharedDirector] pushScene:[Menu scene]];
}


@end
