//
//  Game.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "cocos2d.h"
#import "Peca.h"

@interface Game : CCLayer {
    //Peca *peca;
    NSMutableArray *board;
}
+(CCScene *) scene;
-(void)montaTabuleiro:(CGSize) size;
-(Peca*)getEmptyPiece;
-(Peca*)getNextPiecePosition:(int)x y:(int)y;
-(Peca*) connectionsPath:(Peca*) piece entry:(NSString*) entry;
-(Peca*)getNextPieceConnection:(Peca*)piece outconnection:(NSString*)outconnection;
-(Peca*)getPieceByPosition:(int)x y:(int)y;
-(Peca*)getFirstPiece;
-(void)lightOffPieces;
@end
