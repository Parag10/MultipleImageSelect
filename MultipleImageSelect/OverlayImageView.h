

#import <UIKit/UIKit.h>

@interface OverlayImageView : UIImageView

@property (nonatomic, strong) UILabel *labIndex;

- (void)setIndex:(int)_index;

@end
