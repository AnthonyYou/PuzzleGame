//
//  Menu.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "Menu.h"

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
    
        
        CCMenuItemImage *start = [CCMenuItemImage itemFromNormalImage:@"NEWGAME.png" selectedImage:@"NEWGAME_PRESS.png" target:self selector:@selector(startGame:)];

        CCMenuItemImage *aboutbutton = [CCMenuItemImage itemFromNormalImage:@"BUTTON_ABOUT.png" selectedImage:@"BUTTON_ABOUT.png" target:self selector:@selector(aboutGame:)];

        
        CCMenu *menu = [CCMenu menuWithItems:start,aboutbutton, nil];

        
        [menu alignItemsVertically];
        
        [self addChild: menu];
        
        
        
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"intro.mp3"];
        
        
    }
    return self;
}


-(void) startGame: (CCMenuItem *) menuItem{
    //NSLog(@"start game");

    [[CCDirector sharedDirector] pushScene:[Game sceneWithParam:@"teste"]];
   // [[CCDirector sharedDirector] pushScene:[Game scene]];
}

-(void) aboutGame: (CCMenuItem *) menuItem{
    [[CCDirector sharedDirector] pushScene:[About scene]];
}


@end
