//
//  Game.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//  Copyright 2012 Voice Technology. All rights reserved.
//

#import "Game.h"


@implementation Game
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	Game *layer = [Game node];
	
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
    if( (self=[super init])) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
 
        
        //CCLabelTTF *label = [CCLabelTTF labelWithString:@"tabuleiro" fontName:@"Marker Felt" fontSize:14];
        //label.position =  ccp( size.width /2 , size.height/2 );
        //[self addChild: label];
        
        
        CCSprite *fundo = [CCSprite spriteWithFile:@"tabuleiro.gif" rect:CGRectMake(0, 0, size.width, size.height)];
        fundo.position = ccp( size.width/2, size.height/4 );
        [self addChild:fundo];
        //ccTexParams tp = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_REPEAT};
        //[fundo.texture setTexParameters:&tp];
        
        [self montaTabuleiro:size];
    
        //[self schedule:@selector(update:)];
        
    }
    return self;
}

-(void)montaTabuleiro:(CGSize) size{
    

    peca = [[Peca alloc] initWithPosition:ccp(size.width/2,size.height/2)];
    peca.posX = 0;
    peca.posY = 1;
    
    //CCSprite *peca = [CCSprite spriteWithFile:@"DF_A_OFF.gif"];
    //peca.position = ccp( size.width/3, size.height/2 );
    [self addChild:peca];
    
    NSLog(@"x-->%i,y-->%i",[peca posX], [peca posY]);
    
}

-(void)update:(ccTime)dt{
    NSLog(@"update...");
}

@end
