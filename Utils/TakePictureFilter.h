//
//  TakePictureFilter.h
//  Pods
//
//  Created by lingh on 2021/9/19.
//
#import "VideoFilterDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OnPictureListener <NSObject>

- (void) onPicutre: (NSString *)pic;

@end

@interface TakePictureFilter : NSObject<VideoFilterDelegate>

@property (assign, nonatomic) id<OnPictureListener> picListener;

- (void) takePicture: (NSString *)filepath;

- (CVPixelBufferRef) processFrame:(CVPixelBufferRef)frame;

@end

NS_ASSUME_NONNULL_END

