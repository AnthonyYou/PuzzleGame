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
    
    
    //empty .. improve later
    if (self.type ==0){
        if( (self= [super initWithFile:imagem])) {  
            self.position = pos;
        }
    }else{
    
        if( (self= [super initWithFile:[NSString stringWithFormat:@"%@OFF.gif",imagem]])) {  
            self.position = pos;
        }
    }
    return self;
}

- (void)lightOn{
    if (self.type !=0){
      [self setTexture:[[CCTextureCache sharedTextureCache] addImage:[NSString stringWithFormat:@"%@ON.gif",imagem]]];
    }
}


- (void)lightOff{
    if (self.type != 0){
      [self setTexture:[[CCTextureCache sharedTextureCache] addImage:[NSString stringWithFormat:@"%@OFF.gif",imagem]]];
    }
}

@end
