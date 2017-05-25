//
//  AppDelegate.m
//  Sample-ObjC
//
//  Created by Yohta Watanave on 2017/05/25.
//  Copyright © 2017年 Crypton Future Media .Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "Sample.h"
#import "Blocks.h"
#import "BlocksGridLED.h"

@interface AppDelegate () <BlockFinderDelegate, BlockTouchDelegate>

@property (strong) Sample* sample;
@property (strong) Blocks* blocks;
@property (strong) BlocksGridLED *gridLed;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.sample = [[Sample alloc]init];
    self.sample.delegate = self;
    return YES;
}


- (void)touchChange:(NSArray<BlocksTouch *>*) touches {
    NSLog(@"Touch!!");
    
    NSArray *colors = @[UIColor.blackColor,
                        UIColor.redColor,
                        UIColor.blueColor,
                        UIColor.greenColor,
                        UIColor.whiteColor];
    
    NSInteger rowCount = 5;
    NSInteger colCount = 5;
    NSMutableArray<BlocksGridFill *> *gridFillArray = [NSMutableArray arrayWithCapacity:(rowCount * colCount)];
    
    for (NSInteger i = 0; i < rowCount; ++i) {
        for (NSInteger j = 0; j < colCount; ++j) {
            
            BlocksGridFill *fill = [[BlocksGridFill alloc]init];
            
            NSInteger count = touches.count;
            if (count >= colors.count) {
                count = 0;
            }
            fill.color = colors[count];
            fill.type = filled;
            
            [gridFillArray addObject:fill];
        }
    }
    
    [self.gridLed setGridFills:colCount numRows:rowCount fills:(NSArray*)gridFillArray];
}

- (void)findBlock:(Blocks*) blocks {
    NSLog(@"%@", blocks);
    self.blocks = blocks;
    self.blocks.touchDelegate = self;
    self.gridLed = [[BlocksGridLED alloc]initWithBlocks:blocks];
}


@end
