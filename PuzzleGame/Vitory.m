//
//  HelloWorldLayer.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//


#import "Vitory.h"

@implementation Vitory

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	Vitory *layer = [Vitory node];
	[scene addChild: layer];
	return scene;
}


-(id) init
{
	if( (self=[super init])) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCMenuItemImage *start = [CCMenuItemImage itemFromNormalImage:@"botaoStart.GIF" selectedImage:@"botaoStartB.gif" target:self selector:@selector(backMenu:)];
        CCMenu *menu = [CCMenu menuWithItems:start, nil];
        menu.position = ccp( 69 , (size.height/3)-50  );
        [self addChild: menu];
        
        
        
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Congratulations" fontName:@"Marker Felt" fontSize:64];
		label.position =  ccp( size.width /2 , size.height/2 );
		[self addChild: label];
	}
	return self;
}

-(void) backMenu: (CCMenuItem *) menuItem{
    [[CCDirector sharedDirector] pushScene:[Menu scene]];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
