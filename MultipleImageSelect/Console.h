

#import <Foundation/Foundation.h>

@interface Console : NSObject
{
    NSMutableArray *myIndex;
}
@property (nonatomic,assign) BOOL onOrder;
+ (Console *)mainConsole;
- (void)addIndex:(int)index;
- (void)removeIndex:(int)index;
- (int)currIndex;
- (int)numOfSelectedElements;
- (void)removeAllIndex;
@end
