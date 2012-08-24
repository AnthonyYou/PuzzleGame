//
//  HelloWorldLayer.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Menu.h"

@interface Vitory : CCScene
{
}
+(id)nodeWithGameMoves:(int)moves;
-(id) initWithGameMoves:(int)moves;
@end
