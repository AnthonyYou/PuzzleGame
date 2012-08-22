//
//  Peca.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "Peca.h"


@implementation Peca

@synthesize type,posX,posY,imagem;

- (id)initWithPosition:(CGPoint) pos{
    
    if( (self= [super initWithFile:imagem])) {  
        self.position = pos;
        
        
        //[self setTexture:[[CCTextureCache sharedTextureCache] addImage:@"DF_A_OFF.gif"]];
        
        NSLog(@"x:%i-y:%i",(int)self.position.x,(int)self.position.y);
        
    }
    return self;
}

@end
