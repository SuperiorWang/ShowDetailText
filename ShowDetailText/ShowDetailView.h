//
//  ShowDetailView.h
//  ShowDetailText
//
//  Created by Wangchaoqun on 16/4/6.
//  Copyright © 2016年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowDetailView : UIView

+ (ShowDetailView*)instance;
- (instancetype)initWithTitle:(NSString*)title AndContentText:(NSString*)contentText;

@end
