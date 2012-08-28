//
//  Game.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "cocos2d.h"
#import "Piece.h"
#import "Vitory.h"
#import "Menu.h"

@interface Game : CCLayer {
    NSMutableArray *board;
    CCLabelTTF *totalMoves;
    int moves;
    int initialPointX; 
    int initialPointY; 
    int level;
}
+(CCScene *) scene;
+(CCScene *) sceneWithParam:(id)parameter;
-(id) initWithData:(int) stagelevel;
+(id) nodeWithData:(int) stagelevel;

-(void)createLevel:(int) level;
-(void)createBoard:(CGSize) size stage:(NSString*)stage;
-(Piece*)getEmptyPiece;
-(Piece*)getNextPiecePosition:(int)x y:(int)y;
-(Piece*)connectionsPath:(Piece*) piece entry:(NSString*) entry;
-(Piece*)getNextPieceConnection:(Piece*)piece outconnection:(NSString*)outconnection;
-(Piece*)getPieceByPosition:(int)x y:(int)y;
-(Piece*)getFirstPiece;
-(void)lightOffPieces;
-(BOOL)vitoryVerify:(Piece*)piece entry:(NSString*) entry;
@end
