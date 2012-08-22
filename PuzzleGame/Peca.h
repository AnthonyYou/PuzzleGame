//
//  Peca.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "cocos2d.h"


@interface Peca : CCSprite {
    
}

@property(nonatomic, assign) int type;
@property(nonatomic, assign) int posX;
@property(nonatomic, assign) int posY;
@property(nonatomic, assign) NSString* imagem;

- (id)initWithPosition:(CGPoint) pos;
@end
