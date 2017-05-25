//
//  AppDelegate.swift
//  Sample-Swift
//
//  Created by Yohta Watanave on 2017/05/25.
//  Copyright © 2017年 Crypton Future Media .Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, BlockFinderDelegate, BlockTouchDelegate {

    var window: UIWindow?
    var sample = Sample()
    var blocks: Blocks?
    var gridLed: BlocksGridLED?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.sample.delegate = self
        
        return true
    }
    
    func findBlock(_ blocks: Blocks) {
        self.blocks = blocks;
        self.blocks?.touchDelegate = self;
        self.gridLed = BlocksGridLED(blocks: blocks)
    }
    
    func touchChange(_ touches: [BlocksTouch]) {
        print(#function)
        
        let colors = [UIColor.black, UIColor.red, UIColor.blue, UIColor.green, UIColor.white]
        
        let rowCount = 5
        let colCount = 5
        
        var gridFills = [BlocksGridFill]()
        for _ in 0..<rowCount {
            for _ in 0..<colCount {
                let fill = BlocksGridFill()
                
                let count = min(touches.count, colors.count-1)
                fill.color = colors[count]
                fill.type = BlocksGridFillType.filled
                
                gridFills.append(fill)
            }
        }
        self.gridLed?.setGridFills(colCount, numRows: rowCount, fills: gridFills)
        
    }
}

