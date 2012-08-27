//
//  Game.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "cocos2d.h"
#import "Peca.h"
#import "Vitory.h"
#import "Menu.h"

@interface Game : CCLayer {
    NSMutableArray *board;
    CCLabelTTF *totalMoves;
    int moves;
    int initialPointX; 
    int initialPointY; 
}
+(CCScene *) scene;
-(void)createBoard:(CGSize) size stage:(NSString*)stage;
-(Peca*)getEmptyPiece;
-(Peca*)getNextPiecePosition:(int)x y:(int)y;
-(Peca*)connectionsPath:(Peca*) piece entry:(NSString*) entry;
-(Peca*)getNextPieceConnection:(Peca*)piece outconnection:(NSString*)outconnection;
-(Peca*)getPieceByPosition:(int)x y:(int)y;
-(Peca*)getFirstPiece;
-(void)lightOffPieces;
-(BOOL)vitoryVerify:(Peca*)piece entry:(NSString*) entry;
@end
