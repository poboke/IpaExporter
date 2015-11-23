//
//  IDEArchivesViewController+Hook.m
//  IpaExporter
//
//  Created by Jobs on 15/11/22.
//  Copyright © 2015年 Jobs. All rights reserved.
//

#import "IDEArchivesViewController+Hook.h"
#import "IpaExporter.h"
#import "IDEArchive.h"

@implementation NSObject (IDEArchivesViewControllerHook)

+ (void)Hook
{
    [self jr_swizzleMethod:@selector(viewDidLoad) withMethod:@selector(viewDidLoadHook) error:nil];
}


- (void)viewDidLoadHook
{
    [self viewDidLoadHook];
    
    // Enable the menu item
    [IpaExporter sharedPlugin].enableExportMenuItem = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveWindowDidCloseNotification:)
                                                 name:@"NSWindowDidCloseNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveExportIpaNotification:)
                                                 name:ExportIpaNotification
                                               object:nil];
}


- (void)receiveWindowDidCloseNotification:(NSNotification *)notification
{
    NSWindow *window = notification.object;
    if ([window.windowController isMemberOfClass:NSClassFromString(@"IDEProductsWindowController")]) {
        // Disable the menu item
        [IpaExporter sharedPlugin].enableExportMenuItem = NO;
        [[NSNotificationCenter defaultCenter] removeObserver:self name:ExportIpaNotification object:nil];
    }
}


- (void)receiveExportIpaNotification:(NSNotification *)notification
{
    // Get the selected archive
    NSArrayController *archivesArrayController = [self valueForKey:@"_archivesArrayController"];
    IDEArchive *archive = archivesArrayController.selectedObjects.firstObject;
    if (!archive) {
        return;
    }
    
    // Change current directory to the product path
    NSString *path = archive.productsDirectoryPath.pathString;
    [[NSFileManager defaultManager] changeCurrentDirectoryPath:path];
    
    // Execute terminal commands
    NSString *applicationPath = archive.infoDictionary[@"ApplicationProperties"][@"ApplicationPath"];
    NSString *ipaName = [applicationPath.lastPathComponent.stringByDeletingPathExtension stringByAppendingPathExtension:@"ipa"];
    NSString *cmdCopy = @"cp -r Applications Payload";
    NSString *cmdZip = [NSString stringWithFormat:@"zip -r '%@' Payload", ipaName];
    NSString *cmdRemove = @"rm -r Payload";
    NSString *cmdMove = [NSString stringWithFormat:@"mv '%@' ~/Desktop", ipaName];
    NSArray *cmds = @[cmdCopy, cmdZip, cmdRemove, cmdMove];
    for (NSString *cmd in cmds) {
        system(cmd.UTF8String);
    }
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = [NSString stringWithFormat:@"%@ \nis on the desktop now.", ipaName];
    [alert runModal];
}


@end
