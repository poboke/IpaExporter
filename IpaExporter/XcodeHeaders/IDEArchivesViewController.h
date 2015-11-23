//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "IDEViewController.h"

//#import "DVTTableCellViewTitleEditingDelegate.h"
//#import "IDEFilterControlBarTarget.h"
//#import "IDEInitialization.h"
//#import "IDEProductsInspectableVending.h"
//#import "NSTableViewDelegate.h"

@class DVTBorderedView, DVTObservingToken, DVTTableView, IDEFilterControlBar, NSAlert, NSArray, NSArrayController, NSImage, NSString, NSTableHeaderView, NSTextField;

//@interface IDEArchivesViewController : IDEViewController <IDEFilterControlBarTarget, NSTableViewDelegate, DVTTableCellViewTitleEditingDelegate, IDEInitialization, IDEProductsInspectableVending>
@interface IDEArchivesViewController : IDEViewController
{
    IDEFilterControlBar *_controlBar;
    NSString *_searchString;
    DVTBorderedView *_bottomBorderView;
    NSArrayController *_archivesArrayController;
    NSTableHeaderView *_tableHeaderView;
    DVTTableView *_archivesTableView;
    NSTextField *_statusBarTextField;
    NSImage *_archiveImage;
    DVTObservingToken *_selectedArchivesObservingToken;
    DVTObservingToken *_archivesObservingToken;
    NSAlert *_deleteArchiveAlert;
//    id <IDEProductsInspectable> _currentInspectable;
}

+ (BOOL)ide_initializeWithOptions:(int)arg1 error:(id *)arg2;
+ (id)keyPathsForValuesAffectingArchives;
+ (id)keyPathsForValuesAffectingArchivesFilterPredicate;
+ (void)revealArchive:(id)arg1;
+ (void)revealArchiveNotification:(id)arg1;
//- (void).cxx_destruct;
@property(readonly) NSImage *archiveImage; // @synthesize archiveImage=_archiveImage;
@property(retain, nonatomic) NSArray *archives;
@property(retain) NSArrayController *archivesArrayController; // @synthesize archivesArrayController=_archivesArrayController;
- (id)archivesFilterPredicate;
@property(retain) DVTObservingToken *archivesObservingToken; // @synthesize archivesObservingToken=_archivesObservingToken;
@property __weak DVTTableView *archivesTableView; // @synthesize archivesTableView=_archivesTableView;
@property __weak DVTBorderedView *bottomBorderView; // @synthesize bottomBorderView=_bottomBorderView;
@property __weak IDEFilterControlBar *controlBar; // @synthesize controlBar=_controlBar;
//@property(retain) id <IDEProductsInspectable> currentInspectable; // @synthesize currentInspectable=_currentInspectable;
- (void)deleteArchive:(id)arg1;
@property(retain, nonatomic) NSAlert *deleteArchiveAlert; // @synthesize deleteArchiveAlert=_deleteArchiveAlert;
- (void)deleteArchives:(id)arg1;
- (void)downloadDSYMForArchive:(id)arg1;
- (id)filterButtonMenu;
- (id)filterDefinitionIdentifier;
- (void)handleAction:(id)arg1 fromInspectable:(id)arg2;
- (struct _NSRange)initialSelectionRangeForTableCellView:(id)arg1 usingProposedRange:(struct _NSRange)arg2;
- (void)loadView;
- (void)primitiveInvalidate;
- (void)productsContextMenu_deleteArchive:(id)arg1;
- (void)productsContextMenu_showArchiveInFinder:(id)arg1;
- (void)revealArchive:(id)arg1;
@property(copy) NSString *searchString; // @synthesize searchString=_searchString;
@property(retain) DVTObservingToken *selectedArchivesObservingToken; // @synthesize selectedArchivesObservingToken=_selectedArchivesObservingToken;
@property __weak NSTextField *statusBarTextField; // @synthesize statusBarTextField=_statusBarTextField;
@property __weak NSTableHeaderView *tableHeaderView; // @synthesize tableHeaderView=_tableHeaderView;
@property(readonly) BOOL shouldShowNoSelection;
- (BOOL)tableView:(id)arg1 doCommandBySelector:(SEL)arg2;
- (double)tableView:(id)arg1 heightOfRow:(long long)arg2;
- (id)tableView:(id)arg1 viewForTableColumn:(id)arg2 row:(long long)arg3;
- (void)titleDidChangeForTableCellView:(id)arg1;
- (void)updateStatusBar;
- (BOOL)validateMenuItem:(id)arg1;
- (void)viewDidLoad;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;
@property(readonly, nonatomic) BOOL vendorIsBusy;

@end
