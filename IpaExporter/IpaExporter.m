//
//  IpaExporter.m
//  IpaExporter
//
//  Created by Jobs on 15/11/22.
//  Copyright © 2015年 Jobs. All rights reserved.
//

#import "IpaExporter.h"
#import "IDEArchivesViewController+IpaExporter.h"

@interface IpaExporter ()

@property (nonatomic, strong) NSMenuItem *exportMenuItem;

@end


@implementation IpaExporter

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    // Load only into Xcode
    NSString *identifier = [NSBundle mainBundle].bundleIdentifier;
    if (![identifier isEqualToString:@"com.apple.dt.Xcode"]) {
        return;
    }
    
    [self sharedPlugin];
}


+ (instancetype)sharedPlugin
{
    static IpaExporter *_sharedPlugin;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedPlugin = [[self alloc] init];
    });
    
    return _sharedPlugin;
}


- (instancetype)init
{
    if (self = [super init]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveApplicationDidFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    
    return self;
}


- (void)receiveApplicationDidFinishLaunchingNotification:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NSApplicationDidFinishLaunchingNotification
                                                  object:nil];
    
    [self addPluginsMenu];
    
    [NSClassFromString(@"IDEArchivesViewController") hookIpaExporter];
}


- (void)addPluginsMenu
{
    NSMenu *mainMenu = [NSApp mainMenu];
    if (!mainMenu) {
        return;
    }
    
    // Add Plugins menu next to Window menu
    NSMenuItem *pluginsMenuItem = [mainMenu itemWithTitle:@"Plugins"];
    if (!pluginsMenuItem) {
        pluginsMenuItem = [[NSMenuItem alloc] init];
        pluginsMenuItem.title = @"Plugins";
        pluginsMenuItem.submenu = [[NSMenu alloc] initWithTitle:pluginsMenuItem.title];
        NSInteger windowIndex = [mainMenu indexOfItemWithTitle:@"Window"];
        [mainMenu insertItem:pluginsMenuItem atIndex:windowIndex];
    }
    
    // Add "Export Ipa" menu item
    self.exportMenuItem = ({
        NSMenuItem *subMenuItem = [[NSMenuItem alloc] init];
        subMenuItem.title = @"Export Ipa...";
        subMenuItem.target = nil;
        subMenuItem.action = @selector(doMenuAction);
        [pluginsMenuItem.submenu addItem:subMenuItem];
        subMenuItem;
    });
}


- (void)doMenuAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:ExportIpaNotification object:nil];
}


- (void)setEnableExportMenuItem:(BOOL)enableExportMenuItem
{
    _enableExportMenuItem = enableExportMenuItem;
    
    if (enableExportMenuItem) {
        self.exportMenuItem.target = self;
    } else {
        self.exportMenuItem.target = nil;
    }
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
