
#import <UIKit/UIKit.h>


@interface AssetCell : UITableViewCell

@property (nonatomic, assign) BOOL alignmentLeft;

- (void)setAssets:(NSArray *)assets;

@end
