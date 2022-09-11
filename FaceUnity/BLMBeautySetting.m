//
//  BLMBeautySetting.m
//  Runner
//
//  Created by lingh on 2021/10/9.
//

#import "MJExtension.h"
#import "BLMBeautySetting.h"


@implementation BLMBeautySkin
- (instancetype)init {
    if (self = [super init]) {
        self.blurLevel = @1.0;
        self.colorLevel = @1.0;
        self.redLevel = @0.5;
        self.eyeBright = @0;
        self.toothWhiten = @0;
        self.microPouch = @0;
        self.microNasolabialFolds = @0;
    }

    return self;
}

- (void)toFUManager:(FUManager *)fm {
    NSLog(@"BLMBeautySkin.toFUManager blurLevel: %@ filterLevel: %@ redLevel:%@", self.blurLevel, self.colorLevel, self.redLevel);
    for (FUBeautyParam *bp in fm.skinParams) {
        if ([bp.mParam isEqualToString:@"blur_level"]) {
            bp.mValue = [self.blurLevel floatValue];
        } else if ([bp.mParam isEqualToString:@"color_level"]) {
            bp.mValue = [self.colorLevel floatValue];
        } else if ([bp.mParam isEqualToString:@"red_level"]) {
            bp.mValue = [self.redLevel floatValue];
        } else if ([bp.mParam isEqualToString:@"eye_bright"]) {
            bp.mValue = [self.eyeBright floatValue];
        } else if ([bp.mParam isEqualToString:@"tooth_whiten"]) {
            bp.mValue = [self.toothWhiten floatValue];
        } else if ([bp.mParam isEqualToString:@"remove_pouch_strength"]) {
            bp.mValue = [self.microPouch floatValue];
        } else if ([bp.mParam isEqualToString:@"remove_nasolabial_folds_strength"]) {
            bp.mValue = [self.microNasolabialFolds floatValue];
        }
    }
}

- (BOOL)setValue:(NSString *)param value:(float)value {
    if ([param isEqualToString:@"blur_level"]) {
        self.blurLevel = @(value);
        return true;
    } else if ([param isEqualToString:@"color_level"]) {
        self.colorLevel = @(value);
        return true;
    } else if ([param isEqualToString:@"red_level"]) {
        self.redLevel = @(value);
        return true;
    } else if ([param isEqualToString:@"eye_bright"]) {
        self.eyeBright = @(value);
        return true;
    } else if ([param isEqualToString:@"tooth_whiten"]) {
        self.toothWhiten = @(value);
        return true;
    } else if ([param isEqualToString:@"remove_pouch_strength"]) {
        self.microPouch = @(value);
        return true;
    } else if ([param isEqualToString:@"remove_nasolabial_folds_strength"]) {
        self.microNasolabialFolds = @(value);
        return true;
    } else {
        return false;
    }
}

- (NSDictionary *)toDic {
    return @{
            @"blur_level": self.blurLevel,
            @"color_level": self.colorLevel,
            @"red_level": self.redLevel,
            @"eye_bright": self.eyeBright,
            @"tooth_whiten": self.toothWhiten,
            @"remove_pouch_strength": self.microPouch,
            @"remove_nasolabial_folds_strength": self.microNasolabialFolds,
    };
}

- (float)getValue:(NSString *)param {
    NSDictionary *dic = [self toDic];
    NSNumber *value = dic[param] ?: 0;
    return [value floatValue];
}

@end

@implementation BLMBeautyShape

- (instancetype)init {
    if (self = [super init]) {
        self.cheekThinning = @0;
        self.cheekV = @0;
        self.cheekNarrow = @0;
        self.cheekSmall = @0;
        self.eyeEnlarging = @0;
        self.intensityChin = @0;
        self.intensityForehead = @0;
        self.intensityNose = @0;
        self.intensityMouth = @0;
        self.microCanthus = @0;
        self.microEyeSpace = @0;
        self.microEyeRotate = @0;
        self.microLongNose = @0;
        self.microPhiltrum = @0;
        self.microSmile = @0;
    }

    return self;
}

- (void)toFUManager:(FUManager *)fm {
    NSLog(@"BLMBeautyShape.toFUManager cheekThing:%@ cheekV:%@ cheekNarrow:%@", self.cheekThinning, self.cheekV, self.cheekNarrow);
    for (FUBeautyParam *bp in fm.shapeParams) {
        if ([bp.mParam isEqualToString:@"cheek_thinning"]) {
            bp.mValue = [self.cheekThinning floatValue];
        } else if ([bp.mParam isEqualToString:@"cheek_v"]) {
            bp.mValue = [self.cheekV floatValue];
        } else if ([bp.mParam isEqualToString:@"cheek_narrow"]) {
            bp.mValue = [self.cheekNarrow floatValue];
        } else if ([bp.mParam isEqualToString:@"cheek_small"]) {
            bp.mValue = [self.cheekSmall floatValue];
        } else if ([bp.mParam isEqualToString:@"eye_enlarging"]) {
            bp.mValue = [self.eyeEnlarging floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_chin"]) {
            bp.mValue = [self.intensityChin floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_forehead"]) {
            bp.mValue = [self.intensityForehead floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_nose"]) {
            bp.mValue = [self.intensityNose floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_mouth"]) {
            bp.mValue = [self.intensityMouth floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_canthus"]) {
            bp.mValue = [self.microCanthus floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_eye_space"]) {
            bp.mValue = [self.microEyeSpace floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_eye_rotate"]) {
            bp.mValue = [self.microEyeRotate floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_long_nose"]) {
            bp.mValue = [self.microLongNose floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_philtrum"]) {
            bp.mValue = [self.microPhiltrum floatValue];
        } else if ([bp.mParam isEqualToString:@"intensity_smile"]) {
            bp.mValue = [self.microSmile floatValue];
        }
    }
}

- (BOOL)setValue:(NSString *)param value:(float)value {
    if ([param isEqualToString:@"cheek_thinning"]) {
        self.cheekThinning = @(value);
        return true;
    } else if ([param isEqualToString:@"cheek_v"]) {
        self.cheekV = @(value);
        return true;
    } else if ([param isEqualToString:@"cheek_narrow"]) {
        self.cheekNarrow = @(value);
        return true;
    } else if ([param isEqualToString:@"cheek_small"]) {
        self.cheekSmall = @(value);
        return true;
    } else if ([param isEqualToString:@"eye_enlarging"]) {
        self.eyeEnlarging = @(value);
        return true;
    } else if ([param isEqualToString:@"intensity_chin"]) {
        self.intensityChin = @(value);
        return true;
    } else if ([param isEqualToString:@"intensity_forehead"]) {
        self.intensityForehead = @(value);
        return true;
    } else if ([param isEqualToString:@"intensity_nose"]) {
        self.intensityNose = @(value);
        return true;
    } else if ([param isEqualToString:@"intensity_mouth"]) {
        self.intensityMouth = @(value);
        return true;
    } else if ([param isEqualToString:@"intensity_canthus"]) {
        self.microCanthus = @(value);
        return true;
    } else if ([param isEqualToString:@"intensity_eye_space"]) {
        self.microEyeSpace = @(value);
        return true;
    } else if ([param isEqualToString:@"intensity_long_nose"]) {
        self.microLongNose = @(value);
        return true;
    } else if ([param isEqualToString:@"intensity_philtrum"]) {
        self.microPhiltrum = @(value);
        return true;
    } else if ([param isEqualToString:@"intensity_smile"]) {
        self.microSmile = @(value);
        return true;
    } else {
        return false;
    }
}

- (float)getValue:(NSString *)param {
    NSDictionary *dic = [self toDic];
    NSNumber *value = dic[param] ?: 0;
    return [value floatValue];
}

- (NSDictionary *)toDic {
    return @{
            @"cheek_thinning": self.cheekThinning,
            @"cheek_v": self.cheekV,
            @"cheek_narrow": self.cheekNarrow,
            @"cheek_small": self.cheekSmall,
            @"eye_enlarging": self.eyeEnlarging,
            @"intensity_chin": self.intensityChin,
            @"intensity_forehead": self.intensityForehead,
            @"intensity_nose": self.intensityNose,
            @"intensity_mouth": self.intensityMouth,
            @"intensity_canthus": self.microCanthus,
            @"intensity_eye_space": self.microEyeSpace,
            @"intensity_long_nose": self.microLongNose,
            @"intensity_philtrum": self.microPhiltrum,
            @"intensity_smile": self.microSmile,
    };
}

@end

@implementation BLMBeautySetting

+ (id) initWithJson:(NSString *)json {
    BLMBeautySetting *bs;
    if ([json length] == 0) {
        bs = [[BLMBeautySetting alloc] init];
    } else {
        bs = [BLMBeautySetting mj_objectWithKeyValues:json];
    }
    NSLog(@"BLMBeautySetting filterName:%@ filterLevel:%@ blurLevel: %@ colorLevel: %@ cheekNarrow:%@", bs.filterName, bs.filterLevel, bs.skin.blurLevel, bs.skin.colorLevel, bs.shape.cheekNarrow);
    return bs;
}

- (instancetype)init {
    if (self = [super init]) {
        self.filterName = @"origin";
        self.filterLevel = @0.0;
        self.skin = [[BLMBeautySkin alloc] init];
        self.shape = [[BLMBeautyShape alloc] init];
    }

    return self;
}

- (void)setValue:(NSString *)param value:(float)value {
    if ([self.skin setValue:param value:value]) {
        return;
    } else if ([self.shape setValue:param value:value]) {
        return;
    } else {
        self.filterName = param;
        self.filterLevel = @(value);
    }
}

- (void)toFUManager:(FUManager *)fm {
    FUBeautyParam *bp = [[FUBeautyParam alloc] init];
    bp.mParam = self.filterName;
    bp.mValue = [self.filterLevel floatValue];
    NSLog(@"BLMBeautySetting.toFUManager filterName: %@ filterLevel: %@", self.filterName, self.filterLevel);
    fm.seletedFliter = bp;
    [self.skin toFUManager:fm];
    [self.shape toFUManager:fm];
}

- (NSString *) toJson {
    NSDictionary *dic = self.mj_keyValues;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:0];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end

