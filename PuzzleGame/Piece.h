//
//  Peca.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "cocos2d.h"


@interface Piece : CCSprite {
    NSMutableDictionary *connections;
}

@property(nonatomic, assign) int type;
@property(nonatomic, assign) int posX;
@property(nonatomic, assign) int posY;
@property(nonatomic, assign) NSString* imagem;
@property(nonatomic, assign) BOOL light;

- (id)initWithPosition:(CGPoint) pos;
- (BOOL)lightOn:(NSString*)entry;
- (void)lightOff;
- (void)setConnection:(int) right left:(int)left up:(int)up down:(int)down;
- (NSMutableDictionary*) getConnections;
- (NSString*)getOutConnection:(NSString*)entry;
@end
