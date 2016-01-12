
@class Asset;
@class AssetTablePicker;

@protocol AssetPickerFilterDelegate<NSObject>

// respond YES/NO to filter out (not show the asset)
-(BOOL)assetTablePicker:(AssetTablePicker *)picker isAssetFilteredOut:(Asset *)Asset;

@end