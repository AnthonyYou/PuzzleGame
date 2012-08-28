//
//  HelloWorldLayer.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Menu.h"
#import "Game.h"

@interface Vitory : CCScene
{
    int nextlevel;
}
+(id) nodeWithGameMoves:(int)moves next:(int)next;
-(id) initWithGameMoves:(int)moves next:(int)next;
@end
