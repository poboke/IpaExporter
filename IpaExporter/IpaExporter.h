//
//  IpaExporter.h
//  IpaExporter
//
//  Created by Jobs on 15/11/22.
//  Copyright © 2015年 Jobs. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface IpaExporter : NSObject

+ (instancetype)sharedPlugin;

@property (nonatomic, assign) BOOL enableExportMenuItem;

@end