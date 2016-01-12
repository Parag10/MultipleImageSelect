//
//  AlbumPickerController.h
//
//  Created by ELC on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "AssetSelectionDelegate.h"
#import "AssetPickerFilterDelegate.h"

@interface AlbumPickerController : UITableViewController <AssetSelectionDelegate>

@property (nonatomic, weak) id<AssetSelectionDelegate> parent;
@property (nonatomic, strong) NSMutableArray *assetGroups;
@property (nonatomic, strong) NSArray *mediaTypes;

// optional, can be used to filter the assets displayed
@property (nonatomic, weak) id<AssetPickerFilterDelegate> assetPickerFilterDelegate;

@end

