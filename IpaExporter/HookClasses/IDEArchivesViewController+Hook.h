//
//  IDEArchivesViewController+Hook.h
//  IpaExporter
//
//  Created by Jobs on 15/11/22.
//  Copyright © 2015年 Jobs. All rights reserved.
//

#import "IDEArchivesViewController.h"

static NSString * const ExportIpaNotification = @"ExportIpaNotification";

@interface NSObject (IDEArchivesViewControllerHook)

+ (void)Hook;

@end
