//
//  BLMBeautySetting.h
//  Runner
//
//  Created by lingh on 2021/10/9.
//

#ifndef BLMBeautySetting_h
#define BLMBeautySetting_h

#import "FUManager.h"

@interface BLMBeautySkin : NSObject
@property(strong, nonatomic) NSNumber *blurLevel;
@property(strong, nonatomic) NSNumber *colorLevel;
@property(strong, nonatomic) NSNumber *redLevel;
@property(strong, nonatomic) NSNumber *eyeBright;
@property(strong, nonatomic) NSNumber *toothWhiten;
@property(strong, nonatomic) NSNumber *microPouch;
@property(strong, nonatomic) NSNumber *microNasolabialFolds;

- (BOOL) setValue: (NSString *)param value:(float)value;
- (float) getValue: (NSString *)param;
- (NSDictionary *) toDic;
- (void)toFUManager:(FUManager *)fm;

@end

@interface BLMBeautyShape : NSObject
@property(strong, nonatomic) NSNumber *cheekThinning;
@property(strong, nonatomic) NSNumber *cheekV;
@property(strong, nonatomic) NSNumber *cheekNarrow;
@property(strong, nonatomic) NSNumber *cheekSmall;
@property(strong, nonatomic) NSNumber *eyeEnlarging;
@property(strong, nonatomic) NSNumber *intensityChin;
@property(strong, nonatomic) NSNumber *intensityForehead;
@property(strong, nonatomic) NSNumber *intensityNose;
@property(strong, nonatomic) NSNumber *intensityMouth;
@property(strong, nonatomic) NSNumber *microCanthus;
@property(strong, nonatomic) NSNumber *microEyeSpace;
@property(strong, nonatomic) NSNumber *microEyeRotate;
@property(strong, nonatomic) NSNumber *microLongNose;
@property(strong, nonatomic) NSNumber *microPhiltrum;
@property(strong, nonatomic) NSNumber *microSmile;

- (BOOL) setValue: (NSString *)param value:(float)value;
- (float) getValue: (NSString *)param;
- (NSDictionary *) toDic;
- (void)toFUManager:(FUManager *)fm;

@end

@interface BLMBeautySetting : NSObject
@property(copy, nonatomic) NSString *filterName;
@property(strong, nonatomic) NSNumber *filterLevel;
@property(strong, nonatomic) BLMBeautySkin *skin;
@property(strong, nonatomic) BLMBeautyShape *shape;

+ (id) initWithJson: (NSString *)json;
- (void) setValue: (NSString *)param value:(float)value;
- (void) toFUManager:(FUManager *)fm;
- (NSString *) toJson;
@end

#endif /* BLMBeautySetting_h */
