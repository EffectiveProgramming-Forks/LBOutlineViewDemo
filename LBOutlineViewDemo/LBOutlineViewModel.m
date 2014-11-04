//
//  LBOutlineViewModel.m
//  LBOutlineViewDemo
//
//  Created by Luther Baker on 11/4/14.
//  Copyright (c) 2014 Luther Baker. All rights reserved.
//

#import "LBOutlineViewModel.h"
#import <Cocoa/Cocoa.h>
#import "LBSimpleItem.h"

@interface LBOutlineViewModel () <NSOutlineViewDelegate, NSOutlineViewDataSource>

@property (nonatomic, weak) IBOutlet NSOutlineView *outlineView;
@property (nonatomic) LBSimpleItem *selectedItem;
@property (nonatomic) NSArray *topLevelItems;

@end

@implementation LBOutlineViewModel

- (void)awakeFromNib {
    LBSimpleItem *item1 = [LBSimpleItem itemWithTitle:@"1"];
    LBSimpleItem *item2 = [LBSimpleItem itemWithTitle:@"2"];
    _topLevelItems = @[item1, item2];
}

- (void)reloadSelectedIssue {
    NSLog(@"reload: selected item: %@", _selectedItem);
    NSLog(@"reload: top level item 0: %@", _topLevelItems[0]);
    NSLog(@"reload: top level item 1: %@", _topLevelItems[1]);
    
    //
    // NONE OF THESE WORK!
    //
    // [_outlineView reloadItem:_selectedItem reloadChildren:YES];
    // [_outlineView reloadItem:_topLevelItems[1] reloadChildren:YES];

    //
    // THIS WORKS - but is for NSTableView ...
    //
    NSInteger selectedRow = [_outlineView rowForItem:self.selectedItem];
    if (selectedRow >= 0) {
        [_outlineView reloadDataForRowIndexes:[NSIndexSet indexSetWithIndex:selectedRow]
                                columnIndexes:[NSIndexSet indexSetWithIndex:0]];
    }
}

#pragma mark - NSOutlineViewDataSource

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    if (item == nil) {
        return 2;
    }
    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    if (item == nil) {
        return _topLevelItems[index];
    }
    return nil;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    return (item == nil);
}

#pragma mark - NSOutlineViewDelegate

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
    NSString *identifier = tableColumn.identifier;
    NSTableCellView *cellView = [outlineView makeViewWithIdentifier:identifier owner:nil];
    cellView.textField.stringValue = ((LBSimpleItem *)item).title;
    return cellView;
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification {
    static int count = 2;
    NSOutlineView *outlineView = notification.object;
    NSInteger selectedRow = outlineView.selectedRow;
    _selectedItem = [outlineView itemAtRow:selectedRow];
    LBSimpleItem *simpleItem = (LBSimpleItem *)_selectedItem;
    simpleItem.title = [NSString stringWithFormat:@"%d", ++count];
    NSLog(@"selected item:(%@)", self.selectedItem);
    [self reloadSelectedIssue];
}

@end
