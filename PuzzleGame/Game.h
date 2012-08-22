//
//  Game.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "cocos2d.h"
#import "Peca.h"

@interface Game : CCLayer {
    Peca *peca;
    Peca *pecax;
}
+(CCScene *) scene;
-(void)montaTabuleiro:(CGSize) size;

@end
