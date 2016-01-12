

#import "Console.h"

static Console *_mainconsole;

@implementation Console
+ (Console *)mainConsole
{
    if (!_mainconsole) {
        _mainconsole = [[Console alloc] init];
    }
    return _mainconsole;
}

- (id)init
{
    self = [super init];
    if (self) {
        myIndex = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    myIndex = nil;
    _mainconsole = nil;
}

- (void)addIndex:(int)index
{
    if (![myIndex containsObject:@(index)]) {
        [myIndex addObject:@(index)];
    }
}

- (void)removeIndex:(int)index
{
    [myIndex removeObject:@(index)];
}

- (void)removeAllIndex
{
    [myIndex removeAllObjects];
}

- (int)currIndex
{
    [myIndex sortUsingSelector:@selector(compare:)];
    
    for (int i = 0; i < [myIndex count]; i++) {
        int c = [[myIndex objectAtIndex:i] intValue];
        if (c != i) {
            return i;
        }
    }
    return (int)[myIndex count];
}

- (int)numOfSelectedElements {
    
    return [myIndex count];
}

@end
