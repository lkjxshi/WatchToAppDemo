//
//  InterfaceController.m
//  WatchDemo WatchKit Extension
//
//  Created by 小凯 on 15/6/26.
//  Copyright (c) 2015年 小凯. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *displayLB;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self watchForDataChanges];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void) watchForDataChanges {
    // Listen for notifications on Darwing
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    (__bridge const void *)(self),
                                    NotificationReceivedCallback,
                                    CFSTR("xiaok"),
                                    NULL,
                                    CFNotificationSuspensionBehaviorDeliverImmediately);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cocoaNotificationCallBack) name:@"playersChangedCocoa" object:nil];
}

static void NotificationReceivedCallback(CFNotificationCenterRef center,
                                         void *observer, CFStringRef name,
                                         const void *object, CFDictionaryRef
                                         userInfo)
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playersChangedCocoa" object:nil];
}

void darwinNotificationCenterCallBack() {
    NSLog(@"Notification received from iPhone app!");
    
    // Go from Darwin to Cocoa land
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playersChangedCocoa" object:nil];
}


- (void) cocoaNotificationCallBack {
    NSLog(@"Notification received from ourselves in Cocoa");
    [self.displayLB setText:@"app点击了噢"];
    
}
- (IBAction)btnClick1 {
    [WKInterfaceController openParentApplication:@{@"tag":@"1"} reply:^(NSDictionary *replyInfo, NSError *error) {
    }];
}
- (IBAction)btnClick2 {
    [WKInterfaceController openParentApplication:@{@"tag":@"2"} reply:^(NSDictionary *replyInfo, NSError *error) {
    }];
}
- (IBAction)btnClick3 {
    [WKInterfaceController openParentApplication:@{@"tag":@"3"} reply:^(NSDictionary *replyInfo, NSError *error) {
    }];
}

@end



