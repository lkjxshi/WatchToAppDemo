//
//  ViewController.m
//  WatchDemo
//
//  Created by 小凯 on 15/6/26.
//  Copyright (c) 2015年 小凯. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *watchTagLB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleWatchPressed:) name:@"WATCH_CLICK" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleWatchPressed:(NSNotification*)aNotification{
    NSString *clickTag = [aNotification object];
    _watchTagLB.text = clickTag;
}

-(IBAction)clickBtn:(id)sender{
    CFStringRef observedObject = CFSTR("xiaok");
    NSMutableDictionary *userInfo2 = [NSMutableDictionary new];
    [userInfo2 setValue:@"PicName" forKey:@"PicName"];
    [userInfo2 setValue:@"Source" forKey:@"Source"];
    CFDictionaryRef userInfo = (__bridge CFDictionaryRef)(userInfo2);
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(),(__bridge CFStringRef)@"xiaok",observedObject,userInfo,YES );
}
@end
