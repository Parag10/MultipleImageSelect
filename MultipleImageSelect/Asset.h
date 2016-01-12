

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@class Asset;

@protocol AssetDelegate <NSObject>

@optional
- (void)assetSelected:(Asset *)asset;
- (BOOL)shouldSelectAsset:(Asset *)asset;
- (void)assetDeselected:(Asset *)asset;
- (BOOL)shouldDeselectAsset:(Asset *)asset;
@end


@interface Asset : NSObject

@property (nonatomic, strong) ALAsset *asset;
@property (nonatomic, weak) id<AssetDelegate> parent;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic,assign) int index;

- (id)initWithAsset:(ALAsset *)asset;
- (NSComparisonResult)compareWithIndex:(Asset *)_ass;
@end