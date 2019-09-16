//
//  SCNCodeSnippetGenerator.h
//  SCNCodeSnippet
//
//  Created by Stephen Chiang on 2019/9/17.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCNCodeSnippetGenerator : NSObject

@property (nonatomic, copy, readonly) NSString *directory;

@property (nonatomic, strong) NSURL *outputDirectoryURL;

+ (nonnull instancetype)generator;

- (void)start;

- (void)cleanCodeSnippetFolder;

@end

NS_ASSUME_NONNULL_END
