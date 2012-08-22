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
 
        
        //CCLabelTTF *label = [CCLabelTTF labelWithString:@"tabuleiro" fontName:@"Marker Felt" fontSize:14];
        //label.position =  ccp( size.width /2 , size.height/2 );
        //[self addChild: label];
        
        
        CCSprite *fundo = [CCSprite spriteWithFile:@"tabuleiro.gif" rect:CGRectMake(0, 0, size.width, size.height)];
        fundo.position = ccp( size.width/2, size.height/4 );
        [self addChild:fundo];
        
        //ccTexParams tp = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_REPEAT};
        //[fundo.texture setTexParameters:&tp];
        
        [self setIsTouchEnabled:YES];
        
        [self montaTabuleiro:size];
    
        //[self schedule:@selector(update:)];
        
    }
    return self;
}

-(void)montaTabuleiro:(CGSize) size{
    

    pecax = [Peca alloc];
    
    pecax.type = 1;
    pecax.imagem = @"DF_B_ON.gif";
    
    pecax = [pecax initWithPosition:ccp(103.0,177.0)];
    
    
    //peca = [[Peca alloc] initWithPosition:ccp(103.0,275.0)];
    pecax.posX = 9;
    pecax.posY = 9;
    
    //CCSprite *peca = [CCSprite spriteWithFile:@"DF_A_OFF.gif"];
    //peca.position = ccp( size.width/3, size.height/2 );
    [self addChild:pecax];
    
    
    
    NSLog(@"width:%f-height:%f",size.width,size.height);
    NSLog(@"x-->%i,y-->%i",[peca posX], [peca posY]);
 
    
    for (int x=1; x<4; x++) {
        for (int y=1; y<4; y++) {
                
            peca = [Peca alloc];
            
            peca.type = 1;
            peca.imagem = @"DF_A_OFF.gif";
            
            peca = [peca initWithPosition:ccp(((35.0)*x)+94,((33.0)*y)+177)];
            
            peca.posX = x;
            peca.posY = y;
            
            [self addChild:peca];
            NSLog(@"#%i%i",x,y);
            
        }
    }
    
    
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Touches begin");
    
    //NSArray *touchArray = [touches allObjects];
    
    CCSprite *pecat = [CCSprite spriteWithFile:@"DF_A_OFF.gif"];
    pecat.position = ccp( 100, 100 );
    [self addChild:pecat];
    
    UITouch *pecaTouch = [touches anyObject];
    //UITouch *finger = [touchArray objectAtIndex:0];
    
    CGPoint point = [pecaTouch locationInView:[pecaTouch view]];
    CGPoint location = [[CCDirector sharedDirector] convertToGL:point];
    
    CGRect rect = CGRectMake(pecat.position.x - 20, pecat.position.y -20 , 40.0 , 40.0);
    
    
   // NSLog(@"location-x:%-fy:%f",location.x,location.y);
   // NSLog(@"rect-x:%-fy:%f",rect.origin.x,rect.origin.y);
    //

    
    
    if(CGRectContainsPoint(rect, location)){
        NSLog(@"touched PECAX ################");
    }
    
    //
    
    
    
    //
    
    
    NSLog(@"x:%f,y:%f",point.x,point.y);
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    NSLog(@"Touches ended");
}

-(void)update:(ccTime)dt{
    NSLog(@"update...");
    //atualiza caminho
    //verifica vitoria
}

@end
