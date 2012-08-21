//
//  Peca.h
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//  Copyright 2012 Voice Technology. All rights reserved.
//

#import "cocos2d.h"


@interface Peca : CCSprite {
    
}

@property(nonatomic, assign) int posX;
@property(nonatomic, assign) int posY;

- (id)initWithPosition:(CGPoint) pos;

@end