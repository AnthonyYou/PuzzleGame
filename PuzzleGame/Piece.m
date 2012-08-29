//
//  Peca.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "Piece.h"


@implementation Piece

@synthesize type,posX,posY,imagem, light;

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

- (BOOL)lightOn:(NSString*)entry{
    if (self.type !=0){
        if ([[connections objectForKey:entry] intValue] == 1){
            [self setTexture:[[CCTextureCache sharedTextureCache] addImage:[NSString stringWithFormat:@"%@ON.gif",imagem]]];
            [self setLight:TRUE];
            return TRUE;
        }
    }
    return FALSE;
}


- (void)lightOff{
    if (self.type != 0){
        [self setLight:FALSE];  
        [self setTexture:[[CCTextureCache sharedTextureCache] addImage:[NSString stringWithFormat:@"%@OFF.gif",imagem]]];
    }
}


- (void)setConnection:(int) right left:(int)left up:(int)up down:(int)down{
    
    connections = [[NSMutableDictionary alloc] init];
    
    [connections setObject:[NSNumber numberWithInt:right] forKey:@"right"];
    [connections setObject:[NSNumber numberWithInt:left] forKey:@"left"];
    [connections setObject:[NSNumber numberWithInt:up] forKey:@"up"];
    [connections setObject:[NSNumber numberWithInt:down] forKey:@"down"];
    
}
- (NSMutableDictionary*) getConnections{
    return connections;
}

-(NSString*)getOutConnection:(NSString*)entry{
    
    for (NSString *connection in connections){ 
        
        if (connection != entry){
            
            int number = [[connections objectForKey:connection] intValue];
            
            if (number ==1){
                return connection;
            }
            
        }
    }
    return nil;
}



@end
