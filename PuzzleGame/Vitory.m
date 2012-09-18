//
//  HelloWorldLayer.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//


#import "Vitory.h"

@implementation Vitory


+(id)nodeWithGameMoves:(int)moves next:(int)next{
    
    return [[[self alloc] initWithGameMoves:moves next:next]autorelease];
}

-(id) initWithGameMoves:(int)moves next:(int)next
{
    nextlevel = next;
    
	if( (self=[super init])) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCMenuItemImage *start = [CCMenuItemImage itemFromNormalImage:@"NEWGAME.png" selectedImage:@"NEWGAME_PRESS.png" target:self selector:@selector(backMenu:)];
        
        CCMenuItemImage *next = [CCMenuItemImage itemFromNormalImage:@"NEXT.png" selectedImage:@"NEXT_PRESS.png" target:self selector:@selector(nextLevel:)];
        
        CCMenu *menu = [CCMenu menuWithItems:next,start, nil];
        menu.position = ccp( 69 , (size.height/3)-50  );
        
        [menu alignItemsVertically];
        
        [self addChild: menu];
        
        
		CCLabelTTF *label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"moves:%i",moves] fontName:@"Marker Felt" fontSize:34];
		label.position =  ccp( size.width /2 , size.height/2 );
		[self addChild: label];
	}
	return self;
}

-(void) backMenu: (CCMenuItem *) menuItem{
    [[CCDirector sharedDirector] pushScene:[Menu scene]];
}

-(void) nextLevel: (CCMenuItem *) menuItem{
    
    
    [[CCDirector sharedDirector] replaceScene:[Game nodeWithData:nextlevel]];
    
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
