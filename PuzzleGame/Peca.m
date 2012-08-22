//
//  Peca.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "Peca.h"


@implementation Peca

@synthesize posX,posY;

- (id)initWithPosition:(CGPoint) pos{
    
    if( (self= [super initWithFile:@"DF_A_OFF.gif"])) {    
        self.position = pos;
        

        
        NSLog(@"x:%i-y:%i",(int)self.position.x,(int)self.position.y);
        
    }
    return self;
}

@end
