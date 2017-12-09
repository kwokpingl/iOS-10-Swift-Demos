//
//  Checker.m
//  All My Demos
//
//  Created by Jimmy on 2017/12/8.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "Checker.h"

@implementation Checker

+ (BOOL) is64bitHardware
{
#if __LP64__
    // The app has been compiled for 64-bit intel and runs as 64-bit intel
    return YES;
#endif
    
    // Use some static variables to avoid performing the tasks several times.
    static BOOL sHardwareChecked = NO;
    static BOOL sIs64bitHardware = NO;
    
    if(!sHardwareChecked)
    {
        sHardwareChecked = YES;
        
#if TARGET_IPHONE_SIMULATOR
        // The app was compiled as 32-bit for the iOS Simulator.
        // We check if the Simulator is a 32-bit or 64-bit simulator using the function is64bitSimulator()
        // See https://blog.timac.org/2013/1001-detecting-if-an-app-runs-in-a-32-bit-or-64-bit-ios-simulator
        sIs64bitHardware = Checker.is64bitHardware;
        // The app runs on a real iOS device: ask the kernel for the host info.
        struct host_basic_info host_basic_info;
        unsigned int count;
        kern_return_t returnValue = host_info(mach_host_self(), HOST_BASIC_INFO, (host_info_t)(&host_basic_info), &count);
        if(returnValue != KERN_SUCCESS)
        {
            sIs64bitHardware = NO;
        }
        
        sIs64bitHardware = (host_basic_info.cpu_type == CPU_TYPE_ARM64);
        
#endif // TARGET_IPHONE_SIMULATOR
    }
    
    return sIs64bitHardware;
}


@end
