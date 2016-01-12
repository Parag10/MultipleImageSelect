
#import "SelectMultipleImage.h"
#import "ImagePickerController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/ALAsset.h>

@interface SelectMultipleImage ()

@end

@implementation SelectMultipleImage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)selectImage:(id)sender
{
    UIActionSheet *actionsheet = [[UIActionSheet alloc]initWithTitle:@"Select Image From" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Gallery", nil];
    
    [actionsheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttiontittle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttiontittle isEqualToString:@"Camera"])
    {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc]init];
            
            picker.delegate = self;
            picker.allowsEditing = self;
            
            [self presentViewController:picker animated:YES completion:nil];
         
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Camera is not in Active State" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
    }
    
    if ([buttiontittle isEqualToString:@"Gallery"])
    {
//        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
//        {
//            UIImagePickerController * picker = [[UIImagePickerController alloc]init];
//            
//            picker.delegate = self;
//            picker.allowsEditing = self;
//
//            [self presentViewController:picker animated:YES completion:nil];
//        }
    
    
    
    
    
        ImagePickerController *Picker = [[ImagePickerController alloc] initImagePicker];
        
        Picker.maximumImagesCount = 100; //Set the maximum number of images to select to 100
        Picker.returnsOriginalImage = YES; //Only return the fullScreenImage, not the fullResolutionImage
        Picker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
        Picker.onOrder = YES; //For multiple image selection, display and return order of selected images
        Picker.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie]; //Supports image and movie types
        
        Picker.imagePickerDelegate = self;
        
        [self presentViewController:Picker animated:YES completion:nil];

    
    }
    
}

//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    UIImage *chooseimage =  info[UIImagePickerControllerEditedImage];
//    
//    self.imageview.image = chooseimage;
//    
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}



- (void)ImagePickerController:(ImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    for (UIView *v in [_scrollview subviews]) {
        [v removeFromSuperview];
    }
    
    CGRect workingFrame = _scrollview.frame;
    workingFrame.origin.x = 0;
    
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:[info count]];
    
    for (NSDictionary *dict in info) {
        if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto)
        {
            if ([dict objectForKey:UIImagePickerControllerOriginalImage])
            {
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                
                [images addObject:image];
                
                UIImageView *imgview = [[UIImageView alloc] initWithImage:image];
                
                [imgview setContentMode:UIViewContentModeScaleAspectFit];
                imgview.frame = workingFrame;
                
                [_scrollview addSubview:imgview];
                
                workingFrame.origin.x = workingFrame.origin.x + workingFrame.size.width;
                
            }
            else
            {
                NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
            }
        }
        else
        {
            if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypeVideo)
            {
                if ([dict objectForKey:UIImagePickerControllerOriginalImage])
                {
                    UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                
                    [images addObject:image];
                
                    UIImageView *imgview = [[UIImageView alloc] initWithImage:image];
                    [imgview setContentMode:UIViewContentModeScaleAspectFit];
                    imgview.frame = workingFrame;
                
                    [_scrollview addSubview:imgview];
                
                    workingFrame.origin.x = workingFrame.origin.x + workingFrame.size.width;
                
                }
                else
                {
                    NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
                }
            }
            else
            {
                NSLog(@"Uknown asset type");
            }
        }
    }
    
    self.chosenImages = images;
    
    [_scrollview setPagingEnabled:YES];
    [_scrollview setContentSize:CGSizeMake(workingFrame.origin.x, workingFrame.size.height)];
}



//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}



- (void)ImagePickerControllerDidCancel:(ImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
