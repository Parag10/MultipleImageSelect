
#import "Asset.h"
#import "AssetTablePicker.h"

@implementation Asset

//Using auto synthesizers
- (NSString *)description
{
    return [NSString stringWithFormat:@"Asset index:%d",self.index];
}

- (id)initWithAsset:(ALAsset*)asset
{
	self = [super init];
	if (self) {
		self.asset = asset;
        _selected = NO;
    }
	return self;	
}

- (void)toggleSelection
{
    self.selected = !self.selected;
}

- (void)setSelected:(BOOL)selected
{
    if (selected) {
        if ([_parent respondsToSelector:@selector(shouldSelectAsset:)]) {
            if (![_parent shouldSelectAsset:self]) {
                return;
            }
        }
    } else {
        if ([_parent respondsToSelector:@selector(shouldDeselectAsset:)]) {
            if (![_parent shouldDeselectAsset:self]) {
                return;
            }
        }
    }
    _selected = selected;
    if (selected) {
        if (_parent != nil && [_parent respondsToSelector:@selector(assetSelected:)]) {
            [_parent assetSelected:self];
        }
    } else {
        if (_parent != nil && [_parent respondsToSelector:@selector(assetDeselected:)]) {
            [_parent assetDeselected:self];
        }
    }
}

- (NSComparisonResult)compareWithIndex:(Asset *)_ass
{
    if (self.index > _ass.index) {
        return NSOrderedDescending;
    }
    else if (self.index < _ass.index)
    {
        return NSOrderedAscending;
    }
    return NSOrderedSame;
}

@end

