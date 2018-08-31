//
//  UIImage+BYTool.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/27.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "UIImage+BYTool.h"
#import "CellDataAdapter.h"
#import "UIImage+SolidColor.h"
#import "UIView+SetRect.h"

@implementation UIImage (BYTool)

+(NSArray *)cutToGridWithImage:(UIImage *)image perCount:(NSInteger)count
{
    NSMutableArray * images = [NSMutableArray array];
    CGImageRef cgRef = image.CGImage;

    CGFloat cutWidth = (image.size.width > image.size.height)?(image.size.height/count):(image.size.width/count);
    
    for (NSInteger i = 0; i < count; i++) {
        CGFloat originX = (image.size.width > image.size.height)?fabs(image.size.width - image.size.height)/2:0;
        for (NSInteger j = 0;j < count; j++) {
            CGFloat originY = (image.size.width < image.size.height)?fabs(image.size.width - image.size.height)/2:0;
            CGImageRef imageRef = CGImageCreateWithImageInRect(cgRef, CGRectMake(originX + cutWidth * j,originY + cutWidth * i, cutWidth, cutWidth));
            UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
            CGImageRelease(imageRef);
            if(thumbScale) [images addObject:thumbScale];
        }
    }
    
    return images;
}

+(NSArray *)cutToRectWithImage:(UIImage *)image col:(NSInteger)col row:(NSInteger)row
{
    NSMutableArray * images = [NSMutableArray array];
    CGImageRef cgRef = image.CGImage;
    
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat cutWidth = 0;
    
    CGFloat space = 5;
    
    //如果是扁图
    if (width > height) {
        
        //按理来说 应该用切割后短的部分来当边
        //按照长边来切 (Y轴切割)
        if (((width - space * (row - 1)) /row) < (((height - space * (col - 1))/col))) {
            cutWidth = (width - space * (row - 1)) /row;
            originY = (height - (cutWidth * col) + space * (col - 1))/2;
        }
        
        //按照短边来切 （X轴切割）
        else{
            cutWidth = (height - space * (col - 1))/col;
            originX = (width - (cutWidth * row) + space * (row - 1))/2;
        }
    }
    
    //如果是长图
    else{
        cutWidth = (width - space * (row - 1)) /row;
        originY = (height - (cutWidth * col) + space * (col - 1))/2;
    }
    
    for (NSInteger i = 0; i < col; i++) {
        for (NSInteger j = 0;j < row; j++) {
            CGImageRef imageRef = CGImageCreateWithImageInRect(cgRef, CGRectMake(originX + (cutWidth + space/2) * j,originY + (cutWidth + space/2) * i, cutWidth - space, cutWidth - space));
            UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
            CGImageRelease(imageRef);
            if(thumbScale) [images addObject:thumbScale];
        }
    }
    
    return images;
}

// 长截图 类型可以是 tableView或者scrollView 等可以滚动的视图 根据需要自己改
+ (void)saveLongImage:(UIScrollView *)scrollView {
    
    UIImage* image = nil;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，调整清晰度。
    UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, NO, 0);
    CGPoint savedContentOffset = scrollView.contentOffset;
    CGRect savedFrame = scrollView.frame;
    scrollView.contentOffset = CGPointZero;
    scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
    [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    scrollView.contentOffset = savedContentOffset;
    scrollView.frame = savedFrame;
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        //保存图片到相册
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }
}

+ (UIImage *)addSlaveImage:(UIImage *)slaveImage toMasterImage:(UIImage *)masterImage {
    
    CGSize size;
    size.width = masterImage.size.width;
    size.height = masterImage.size.height + slaveImage.size.height;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);

    //Draw masterImage
    [masterImage drawInRect:CGRectMake(0, 0, masterImage.size.width, masterImage.size.height)];
    
    //Draw slaveImage
    [slaveImage drawInRect:CGRectMake(0, masterImage.size.height, masterImage.size.width, slaveImage.size.height)];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return resultImage;
}

+(UIImage *)saveLongImageWithAssets:(NSArray<UIImage *> *)images space:(CGFloat)space
{
    CGSize size;
    NSMutableArray * operateImages  = [images mutableCopy];
    
    //过滤空白内容
    {
        
        id itemF      = operateImages.firstObject;
        id itemL      = operateImages.lastObject;
        
        CellDataAdapter * adatperF = (CellDataAdapter *)itemF;
        CellDataAdapter * adatperL = (CellDataAdapter *)itemL;

        if ([itemF isKindOfClass:[CellDataAdapter class]]) {
            if ([adatperF.cellReuseIdentifier isEqualToString:@"empty"] && [adatperL.cellReuseIdentifier isEqualToString:@"empty"]) {
                [operateImages removeObject:itemL];
                [operateImages removeObject:itemF];
            }
        }
    }

    id item;
    
    //搞定尺寸
    {
        CGFloat height = 0;
        
        for (int i = 0; i < operateImages.count; i++) {
            item = operateImages[i];
            UIImage * image;
            
            if ([item isKindOfClass:[UIImage class]]) {
                image = (UIImage *)item;

            }else if([item isKindOfClass:[CellDataAdapter class]]){
                CellDataAdapter * adapter = (CellDataAdapter *)item;
                image = adapter.data;
            }
            
            //等比缩放
            CGFloat scale = Screen_Width/image.size.width;
            
            height += image.size.height * scale;
            
            if (i< operateImages.count - 1) {
                height += space;
            }
        }
        
        size.width = Screen_Width;
        size.height = height;
        
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        
        UIImage * bgImage = [UIImage imageWithSize:size color:[UIColor whiteColor]];
        [bgImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    }
    
    
    {
        CGFloat height = 0;
        
        for (int i = 0; i < operateImages.count; i++) {
            item = operateImages[i];
            UIImage * image;
            
            if ([item isKindOfClass:[UIImage class]]) {
                image = (UIImage *)item;
                
            }else if([item isKindOfClass:[CellDataAdapter class]]){
                CellDataAdapter * adapter = (CellDataAdapter *)item;
                image = adapter.data;
                
                if ([adapter.cellReuseIdentifier isEqualToString:@"empty"]) {
                    UIImage * replaceIMG = [UIImage imageWithSize:image.size color:[UIColor whiteColor]];
                    image = replaceIMG;
                }
            }
            CGFloat tmpHeight = height;
            //等比缩放
            CGFloat scale = Screen_Width/image.size.width;
            height += image.size.height * scale;
            
            [image drawInRect:CGRectMake(0, tmpHeight, Screen_Width, image.size.height * scale)];
            
            if (i< operateImages.count - 1) {
                height += space;
            }
        }
    }
    
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return [[self class] addWatermarkWithImage:resultImage];
}

+ (UIImage *)addWatermarkWithImage:(UIImage *)targetImage
{
    CGFloat waterMarkHeight = 50;
    
    CGSize drawSize = CGSizeMake(targetImage.size.width, targetImage.size.height + waterMarkHeight * 2);
    UIGraphicsBeginImageContext(drawSize);
    UIGraphicsBeginImageContextWithOptions(drawSize, YES, 0);
    
    UIImage * bgWightImage = [UIImage imageWithSize:CGSizeMake(targetImage.size.width, 50) color:[UIColor whiteColor]];
    [bgWightImage drawInRect:CGRectMake(0, 0, drawSize.width, waterMarkHeight)];
    [targetImage drawInRect:CGRectMake(0, waterMarkHeight, targetImage.size.width, targetImage.size.height)];
    [bgWightImage drawInRect:CGRectMake(0, drawSize.height - waterMarkHeight, drawSize.width, waterMarkHeight)];
    
    UIImage * logo = [UIImage imageNamed:@"红色logo"];
    [logo drawInRect:CGRectMake((drawSize.width - logo.size.width)/2, (waterMarkHeight - logo.size.height)/2, logo.size.width, logo.size.height)];
    [logo drawInRect:CGRectMake((drawSize.width - logo.size.width)/2, (waterMarkHeight - logo.size.height)/2 + drawSize.height - waterMarkHeight, logo.size.width, logo.size.height)];
    
    UIImage * QRCodeImage = [UIImage imageNamed:@"水印二维码"];
    [QRCodeImage drawInRect:CGRectMake(drawSize.width - 20 - 37, drawSize.height - waterMarkHeight + 6.5, 36, 37)];

    UIImage * resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}

// 保存后回调方法

- (void)image: (UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    NSString *msg = nil ;
    
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功，可到相册查看" ;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定"  otherButtonTitles:nil];
    [alert show];
}

@end
