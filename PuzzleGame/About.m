//
//  About.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 18/09/12.
//  Copyright (c) 2012 Voice Technology. All rights reserved.
//

#import "About.h"

@implementation About

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	About *layer = [About node];
	
	[scene addChild: layer];
	
	return scene;
}
-(id) init
{
    if( (self=[super init])) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *fundo = [CCSprite spriteWithFile:@"SPLASH.png" rect:CGRectMake(0, 0, size.width, size.height)];
        fundo.position = ccp( size.width/2, size.height/2 );
        [self addChild:fundo];
        
        CCMenuItemImage *start = [CCMenuItemImage itemFromNormalImage:@"MAIN.png" selectedImage:@"MAIN_PRESS.png" target:self selector:@selector(mainmenu:)];
        
        CCMenu *menu = [CCMenu menuWithItems:start, nil];
        
        menu.position = ccp( size.width/2, (size.height/4)+20 );
        
        [menu alignItemsVertically];
        
        [self addChild: menu];
        
    }
    return self;
}


-(void) mainmenu: (CCMenuItem *) menuItem{
    //NSLog(@"start game");
    
    //[[CCDirector sharedDirector] pushScene:[Game sceneWithParam:@"teste"]];
    [[CCDirector sharedDirector] pushScene:[Menu scene]];
}

@end
