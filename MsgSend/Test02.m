//
//  Test02.m
//  ttt
//
//  Created by 吴非凡 on 16/2/24.
//  Copyright © 2016年 PCI. All rights reserved.
//

#import "Test02.h"
#import <objc/runtime.h>
void test02(id self, SEL _cmd)
{
    NSLog(@"test02");
}

@implementation Test02

+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == @selector(test)) {
                // 该方法第一个参数为添加方法的类
                // 第二个参数为方法的声明
                // 第三个参数为方法的实现
                // 第四个参数为方法的类型即TypeEncodings。从左到右依次为返回值类型、参数类型。可参考官方文档https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
                class_addMethod([self class], aSEL, (IMP)test02, "v@:");
                return YES;
//        return NO;
    }
    return [super resolveInstanceMethod:aSEL];
}




@end
