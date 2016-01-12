

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "Asset.h"
#import "AssetSelectionDelegate.h"
#import "AssetPickerFilterDelegate.h"

@interface AssetTablePicker : UITableViewController <AssetDelegate>

@property (nonatomic, weak) id <AssetSelectionDelegate> parent;
@property (nonatomic, strong) ALAssetsGroup *assetGroup;
@property (nonatomic, strong) NSMutableArray *Assets;
@property (nonatomic, strong) IBOutlet UILabel *selectedAssetsLabel;
@property (nonatomic, assign) BOOL singleSelection;
@property (nonatomic, assign) BOOL immediateReturn;

// optional, can be used to filter the assets displayed
@property(nonatomic, weak) id<AssetPickerFilterDelegate> assetPickerFilterDelegate;

- (int)totalSelectedAssets;
- (void)preparePhotos;

- (void)doneAction:(id)sender;

@end