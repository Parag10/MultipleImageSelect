

#import <Foundation/Foundation.h>

@class Asset;

@protocol AssetSelectionDelegate <NSObject>

- (void)selectedAssets:(NSArray *)assets;
- (BOOL)shouldSelectAsset:(Asset *)asset previousCount:(NSUInteger)previousCount;
- (BOOL)shouldDeselectAsset:(Asset *)asset previousCount:(NSUInteger)previousCount;

@end
