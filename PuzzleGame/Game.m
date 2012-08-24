//
//  Game.m
//  PuzzleGame
//
//  Created by Roberto Capelo on 21/08/12.
//

#import "Game.h"


@implementation Game
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	Game *layer = [Game node];
	
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
    if( (self=[super init])) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *fundo = [CCSprite spriteWithFile:@"tabuleiro.gif" rect:CGRectMake(0, 0, size.width, size.height)];
        fundo.position = ccp( size.width/2, size.height/4 );
        [self addChild:fundo];

        
        CCMenuItemImage *giveup = [CCMenuItemImage itemFromNormalImage:@"botaoDesistir.gif" selectedImage:@"botaoDesistir.gif" target:self selector:@selector(backMenu:)];
        
        CCMenu *menu = [CCMenu menuWithItems:giveup, nil];
        
        menu.position = ccp( 69 , (size.height/3)-50  );
        
        //[menu alignItemsVertically];
        [self addChild: menu];

        
        totalMoves = [CCLabelTTF labelWithString:@"moves: 0" fontName:@"Marker Felt" fontSize:14];
        totalMoves.position =  ccp( 60 , size.height -147 );
        [self addChild: totalMoves];
        
        //ccTexParams tp = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_REPEAT};
        //[fundo.texture setTexParameters:&tp];
        
        [self setIsTouchEnabled:YES];
        
        [self montaTabuleiro:size];
        
        [self connectionsPath:[self getFirstPiece] entry:nil];
        
        [self schedule:@selector(update:)];
        
    }
    return self;
}

-(void)montaTabuleiro:(CGSize) size{
    
    Peca *peca;
    board = [[NSMutableArray alloc] init];
    
    for (int x=1; x<4; x++) {
        for (int y=1; y<4; y++) {
                
            peca = [Peca alloc];
            
            
            peca.type = 1;
            
            //temporary fixed boad pieces
            if ((x==2) && (y==2)){
                peca.imagem = @"DF_A_";
                [peca setConnection:0 left:0 up:1 down:1];
            }
            if ((x==2) && (y==1)){
                peca.imagem = @"DF_C_";
                [peca setConnection:1 left:0 up:1 down:0];
            }
            if (x==3){
                peca.imagem = @"DF_B_";
                [peca setConnection:1 left:1 up:0 down:0];
            }
            if ((x==1) && (y==1)){
                peca.imagem = @"DF_D_";
                [peca setConnection:1 left:0 up:0 down:1];
            }
            if ((x==1) && (y==2)){
                peca.imagem = @"DF_E_";
                [peca setConnection:0 left:1 up:0 down:1];
            }
            if ((x==1) && (y==3)){
                peca.imagem = @"DF_VAZIO.gif";
                peca.type = 0;
            }
            if ((x==2) && (y==3)){
                peca.imagem = @"DF_F_";
                [peca setConnection:0 left:1 up:1 down:0];
            }
            peca = [peca initWithPosition:ccp(((35.0)*x)+94,((33.0)*y)+177)];
            
            peca.posX = x;
            peca.posY = y;
            
            [board addObject:peca];
            
            [self addChild:peca];
            NSLog(@"#%i%i",x,y);
            
        }
    }
}

-(Peca*)getNextPieceConnection:(Peca*)piece outconnection:(NSString*)outconnection{
    
    NSString *connectionOut =  outconnection;
    if (connectionOut == @"down"){
        NSLog(@"DONW");
        return [self getPieceByPosition:piece.posX y:piece.posY-1];
    }else if(connectionOut == @"up"){
        NSLog(@"UP");
        return [self getPieceByPosition:piece.posX y:piece.posY+1];
    }else if(connectionOut ==@"left"){
        NSLog(@"LEFT");
        return [self getPieceByPosition:piece.posX-1 y:piece.posY];
    }else if (connectionOut ==@"right"){
        NSLog(@"RIGHT");
        return [self getPieceByPosition:piece.posX+1 y:piece.posY];
    }
    
    return nil;
}

-(Peca*)getPieceByPosition:(int)x y:(int)y{
    
    for (Peca *peca in board){
        
        if ((peca.posX == x) && (peca.posY == y)){
            return peca;
        }
    }
    return nil;
}

-(Peca*)getNextPiecePosition:(int)x y:(int)y{
    
    Peca *emptyPiece = [self getEmptyPiece];
    if (x == [emptyPiece posX]){
        if (y+1 == [emptyPiece posY]){
            return emptyPiece;
        }else if (y-1 == [emptyPiece posY]){
            return emptyPiece;
        }
    }else if(y == [emptyPiece posY]){
        if (x+1 == [emptyPiece posX]){
            return emptyPiece;
        }else if (x-1 == [emptyPiece posX]){
            return emptyPiece;
        }
    }
    
    return nil;
}

-(Peca*)getEmptyPiece{
    
    
    for(Peca *p in board){
        
        if ([p type] == 0){
            return p;
        }
    }
    
    return nil;
}

-(void)lightOffPieces{
    for(Peca *piece in board){
        [piece lightOff];
    }
    
}

-(Peca*)getFirstPiece{
    int initialPointX = 1; 
    int initialPointY = 2; 
    
    for(Peca *piece in board){
        if ((piece.posY == initialPointY)&&(piece.posX==initialPointX)){
            return piece;
        }
    }    
    return nil;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    
    for(Peca *p in board){

        UITouch *pieceTouch = [touches anyObject];
    
        CGPoint point = [pieceTouch locationInView:[pieceTouch view]];
        CGPoint location = [[CCDirector sharedDirector] convertToGL:point];
        CGRect rect = CGRectMake(p.position.x - 20, p.position.y -20 , 40.0 , 40.0);
    
        if(CGRectContainsPoint(rect, location)){
            // no (empty) piece
            if (p.type != 0){
                NSLog(@"[TOUCHED PIECE] x:%i y:%i", p.posX, p.posY);  
            
                Peca *emptyPiece = [self getNextPiecePosition:p.posX y:p.posY];
              
                if (emptyPiece != nil){
                    
                    [self lightOffPieces];
                    
                    CGPoint location = p.position;
                  
                    int posXTemp = [p posX];
                    int posYTemp = [p posY];
                  
                    [p setPosition:[emptyPiece position]];
                  
                    [p setPosX:[emptyPiece posX]];
                    [p setPosY:[emptyPiece posY]];
                    [emptyPiece setPosition:location];
                    [emptyPiece setPosX:posXTemp];
                    [emptyPiece setPosY:posYTemp];
                    moves++;
                    [totalMoves setString: [NSString stringWithFormat:@"moves: %i",moves]];
                    
                    //PATH PIECE LIGHT ON
                    [self connectionsPath:[self getFirstPiece] entry:nil];
                    
                }
            }
        }
    }
}

-(BOOL) vitoryVerify:(Peca*)piece{
    int finalPointX = 3; 
    int finalPointY = 1; 
    
    int pox = [piece posX];
    int poy = [piece posY];
    NSLog(@"-->%i-%i",pox,poy);
    
    if ((pox == finalPointX) && (poy == finalPointY)){
        NSLog(@"%@", @"######### [ VITORY ] #########");
        return YES;
    }

    return NO;
}


// recursive function por verify light path
-(Peca*) connectionsPath:(Peca*) piece entry:(NSString*) entry{
    
    int initialPointX = 1; 
    int initialPointY = 2; 
    if (piece.type != 0){
        if (entry == nil){
            //Initial point
        
            if ((piece.posY == initialPointY)&&(piece.posX==initialPointX)){
                if ([piece lightOn:@"left"]){ // try to light ON 
                
                    NSString *connectionOut =  [piece getOutConnection:@"left"]; //get other exit point 
                    
                    Peca *temp = [self getNextPieceConnection:piece outconnection:connectionOut]; // get next piece 
                    
                    [self connectionsPath:temp entry:connectionOut]; // verify temp piece 
                }
            }
        
        }else{
            
            // invert out to in point
            if (entry == @"down"){
                entry =  @"up";
            }else if (entry ==@"up"){
                entry =  @"down";
            }else if (entry ==@"left"){
                entry =  @"right";
            }else if (entry ==@"right"){
                entry = @"left";
            }
            
            if ([piece lightOn:entry]){
                
                if ([self vitoryVerify:piece]){
                    [[CCDirector sharedDirector] pushScene:[Vitory scene]];
                }else{
                    NSString *connectionOut =  [piece getOutConnection:entry]; 
                    Peca *temp = [self getNextPieceConnection:piece outconnection:connectionOut];
                    [self connectionsPath:temp entry:connectionOut];
                }
            }
        }
    }
    return nil;
    
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    NSLog(@"Touches ended");
}

-(void) backMenu: (CCMenuItem *) menuItem{
    [[CCDirector sharedDirector] pushScene:[Menu scene]];
}

-(void)update:(ccTime)dt{
    //NSLog(@"update...");
    //vitory verify
}

@end
