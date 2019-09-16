//
//  SCNCodeSnippetManager.m
//  SCNCodeSnippet
//
//  Created by Stephen Chiang on 2019/9/17.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNCodeSnippetManager.h"
#import "SCNCodeSnippet.h"

@interface SCNCodeSnippetManager ()

@end

@implementation SCNCodeSnippetManager

- (NSURL *)outputDirectoryURL {
    if (!_outputDirectoryURL) {
        NSAssert(_outputDirectoryURL, @"The `outputDirectoryURL` is nil.");
    }
    return _outputDirectoryURL;
}

+ (nonnull instancetype)sharedManager {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (NSURL *)fileURLWithCodeSnippet:(SCNCodeSnippet *)codeSnippet {
    NSString *filename = [codeSnippet.identifier stringByAppendingPathExtension:@"codesnippet"];
    return [self.outputDirectoryURL URLByAppendingPathComponent:filename];
}

- (BOOL)addCodeSnippet:(SCNCodeSnippet *)codeSnippet
                 error:(NSError * _Nullable *)error {
    NSURL *fileURL = [self fileURLWithCodeSnippet:codeSnippet];
    return [[codeSnippet toDictionary] writeToURL:fileURL error:error];
}

- (BOOL)addCodeSnippets:(NSArray<SCNCodeSnippet *> *)codeSnippets
                  error:(NSError * _Nullable *)error {
    BOOL result = YES;
    for (SCNCodeSnippet *codeSnippet in codeSnippets) {
        NSURL *fileURL = [self fileURLWithCodeSnippet:codeSnippet];
        result = [[codeSnippet toDictionary] writeToURL:fileURL error:error];
        if (!result) { return result; }
    }
    return result;
}

@end
