//
//  SCNCodeSnippetGenerator.m
//  SCNCodeSnippet
//
//  Created by Stephen Chiang on 2019/9/17.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNCodeSnippetGenerator.h"
#import "SCNCodeSnippetManager.h"

@implementation SCNCodeSnippetGenerator

- (NSURL *)outputDirectoryURL {
    if (!_outputDirectoryURL) {
        NSAssert(_outputDirectoryURL, @"The `outputDirectoryURL` is nil.");
    }
    return _outputDirectoryURL;
}

- (NSURL *)directoryURL {
    NSURL *directoryURL = self.outputDirectoryURL;
    if (self.directory) {
        directoryURL = [directoryURL URLByAppendingPathComponent:self.directory];
    }
    return directoryURL;
}

+ (nonnull instancetype)generator {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (void)start {
    [self setUpOutputDirectoryURL];
}

- (void)cleanCodeSnippetFolder {
    NSError *error = nil;
    [NSFileManager.defaultManager removeItemAtURL:[self directoryURL] error:&error];
    if (error) { NSLog(@"Error: %@", error); }
}

- (void)setUpOutputDirectoryURL {
    NSURL *directoryURL = [self directoryURL];
    NSError *error = nil;
    if (![NSFileManager.defaultManager fileExistsAtPath:directoryURL.absoluteString]) {
        [NSFileManager.defaultManager createDirectoryAtURL:directoryURL
                               withIntermediateDirectories:NO
                                                attributes:nil
                                                     error:&error];
    }
    if (error) { NSLog(@"Error: %@", error); }
    SCNCodeSnippetManager.sharedManager.outputDirectoryURL = directoryURL;
}

@end
