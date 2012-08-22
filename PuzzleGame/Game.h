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
    NSMutableArray *board;
}
+(CCScene *) scene;
-(void)montaTabuleiro:(CGSize) size;
-(Peca*)getEmptyPiece;
-(Peca*)getNextPiecePosition:(int)x y:(int)y;
@end
