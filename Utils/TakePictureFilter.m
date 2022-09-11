//
//  TakePictureFilter.m
//  agora_rtc_engine
//
//  Created by lingh on 2021/9/19.
//
#import "TakePictureFilter.h"

@interface TakePictureFilter()<VideoFilterDelegate>

@property (assign, nonatomic) BOOL takePicture;
@property (assign, nonatomic) BOOL takingPicture;
@property (copy, nonatomic) NSString* filepath;

- (UIImage*) imageFromPixelBuffer:(CVPixelBufferRef) p;

@end

@implementation TakePictureFilter

- (void) takePicture:(NSString *)filepath {
    if (self.takePicture || self.takingPicture) {
        return;
    }
    self.filepath = filepath;
    self.takePicture = true;
}

- (CVPixelBufferRef) processFrame:(CVPixelBufferRef)frame {
    if (!self.takePicture) {
        return frame;
    }
    self.takingPicture = true;
    self.takePicture = false;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage* image = [self imageFromPixelBuffer:frame];
        NSData* imageData = imageData = UIImageJPEGRepresentation(image, 1.0);
        [imageData writeToFile:self.filepath atomically:YES];
        [self.picListener onPicutre:self.filepath];
        self.takingPicture = false;
    });
    return frame;
}

- (UIImage*) imageFromPixelBuffer:(CVPixelBufferRef) p {
    CVPixelBufferRef bufferRef = p;
    CVPixelBufferRetain(bufferRef);
    
    CIImage* ciImage = [CIImage imageWithCVPixelBuffer:bufferRef];
    
    CIContext* context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(YES)}];
    
    CGRect rect = CGRectMake(0, 0, CVPixelBufferGetWidth(p), CVPixelBufferGetHeight(p));
    CGImageRef videoImage = [context createCGImage:ciImage fromRect:rect];
    
    UIImage* image = [UIImage imageWithCGImage:videoImage];
    CGImageRelease(videoImage);
    
    CVPixelBufferRelease(bufferRef);
    
    return image;
}

@end
