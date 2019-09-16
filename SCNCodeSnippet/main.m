//
//  main.m
//  SCNCodeSnippet
//
//  Created by Stephen Chiang on 2019/9/17.
//  Copyright © 2019 Stephen Chiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCNCodeSnippetManager.h"
#import "SCNObjCPropertyCodeSnippetGenerator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSURL *outputDirectoryURL = [NSURL fileURLWithPath:@"/Users/stephenchiang/Desktop"];
        SCNObjCPropertyCodeSnippetGenerator.generator.outputDirectoryURL = outputDirectoryURL;
        [SCNObjCPropertyCodeSnippetGenerator.generator cleanCodeSnippetFolder];
        [SCNObjCPropertyCodeSnippetGenerator.generator start];
    }
    return 0;
}
