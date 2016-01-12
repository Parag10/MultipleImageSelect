

#import <UIKit/UIKit.h>

@interface SelectMultipleImage : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate>

//@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

- (IBAction)selectImage:(id)sender;

@property (nonatomic, copy) NSArray *chosenImages;

@end
