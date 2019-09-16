//
//  SCNCodeSnippetManager.h
//  SCNCodeSnippet
//
//  Created by Stephen Chiang on 2019/9/17.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCNCodeSnippet.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCNCodeSnippetManager : NSObject

@property (nonatomic, strong) NSURL *outputDirectoryURL;

+ (nonnull instancetype)sharedManager;

- (BOOL)addCodeSnippet:(SCNCodeSnippet *)codeSnippet
                 error:(NSError * _Nullable *)error;

- (BOOL)addCodeSnippets:(NSArray<SCNCodeSnippet *> *)codeSnippets
                  error:(NSError * _Nullable *)error;

@end

NS_ASSUME_NONNULL_END
