//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  lsyTecnetSportDylib.m
//  lsyTecnetSportDylib
//
//  Created by lsy on 2019/6/18.
//  Copyright (c) 2019 lsy. All rights reserved.
//

#import "lsyTecnetSportDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <MDCycriptManager.h>
#import "TweakHeader.h"

CHConstructor{
    printf(INSERT_SUCCESS_WELCOME);
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
#ifndef __OPTIMIZE__
        CYListenServer(6666);

        MDCycriptManager* manager = [MDCycriptManager sharedInstance];
        [manager loadCycript:NO];

        NSError* error;
        NSString* result = [manager evaluateCycript:@"UIApp" error:&error];
        NSLog(@"result: %@", result);
        if(error.code != 0){
            NSLog(@"error: %@", error.localizedDescription);
        }
#endif
        
    }];
}

CHDeclareClass(QSAppDelegate)

CHOptimizedMethod0(self, QSSplashManager *, QSAppDelegate, splashManager) {
    return nil;
}

CHDeclareClass(QSMatchDetailTopViewController)

CHOptimizedMethod0(self, void, QSMatchDetailTopViewController, updateMediaPlayerData) {
    CHSuper0(QSMatchDetailTopViewController, updateMediaPlayerData);
    QSMediaPlayer *mediaPlayer = self.mediaPlayer;
    if (self.mediaPlayer) {
        QSPlayerRootView *rootView = mediaPlayer.view;
        if (rootView) {
            QSPlayerConfigItem *item = rootView.configItem;
            item.skipAd = YES;
        }
    }
}

CHConstructor {
    
    CHLoadLateClass(QSAppDelegate);
    CHHook0(QSAppDelegate, splashManager);

    CHLoadLateClass(QSMatchDetailTopViewController);
    CHHook0(QSMatchDetailTopViewController, updateMediaPlayerData);
    
}

