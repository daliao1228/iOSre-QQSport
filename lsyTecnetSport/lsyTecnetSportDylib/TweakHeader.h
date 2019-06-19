//
//  TweakHeader.h
//  lsyTecnetSport
//
//  Created by lsy on 2019/6/19.
//  Copyright © 2019 lsy. All rights reserved.
//

@interface QSSplashManager : NSObject

@end

@interface QSPlayerConfigItem : NSObject

@property (nonatomic, assign) BOOL skipAd;

@end

@interface QSPlayerRootView : UIView

@property (nonatomic, strong) QSPlayerConfigItem *configItem;

@end

@interface QSMediaPlayer : NSObject

@property (nonatomic, strong) QSPlayerRootView *view;

@end

@interface QSMatchDetailTopViewController : NSDictionary

@property (nonatomic, strong) QSMediaPlayer *mediaPlayer;

@end
