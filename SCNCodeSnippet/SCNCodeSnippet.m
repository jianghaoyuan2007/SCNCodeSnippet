//
//  SCNCodeSnippet.m
//  SCNCodeSnippet
//
//  Created by Stephen Chiang on 2019/9/17.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNCodeSnippet.h"

// Platform
NSString * const SCNCodeSnippetPlatformiOS = @"iphoneos";
NSString * const SCNCodeSnippetPlatformAll = @"All";

// Language
NSString * const SCNCodeSnippetLanguageObjC = @"Xcode.SourceCodeLanguage.Objective-C";
NSString * const SCNCodeSnippetLanguageSwift = @"Xcode.SourceCodeLanguage.Swift";

// Scope
NSString * const SCNCodeSnippetScopeClassImplementation = @"ClassImplementation";
NSString * const SCNCodeSnippetScopeClassInterfaceVariables = @"ClassInterfaceVariables";
NSString * const SCNCodeSnippetScopeClassInterfaceMethods = @"ClassInterfaceMethods";
NSString * const SCNCodeSnippetScopeCodeExpression = @"CodeExpression";
NSString * const SCNCodeSnippetScopeCodeBlock = @"CodeBlock";
NSString * const SCNCodeSnippetScopePreprocessor = @"Preprocessor";
NSString * const SCNCodeSnippetScopeStringOrComment = @"StringOrComment";
NSString * const SCNCodeSnippetScopeTopLevel = @"TopLevel";
NSString * const SCNCodeSnippetScopeAll = @"All";

@interface SCNCodeSnippet ()

@property (nonatomic, assign, getter=isUserSnippet) BOOL userSnippet;

@property (nonatomic, assign) NSInteger version;

@end

@implementation SCNCodeSnippet

- (instancetype)init {
    if (self = [super init]) {
        _identifier = NSUUID.UUID.UUIDString;
        _userSnippet = YES;
        _version = 2;
    }
    return self;
}

+ (instancetype)codeSnippetWithTitle:(NSString *)title
                             summary:(NSString *)summary
                            platform:(kSCNCodeSnippetPlatform)platform
                            language:(kSCNCodeSnippetLanguage)language
                            shortcut:(NSString *)shortcut
                              scopes:(NSArray<NSNumber *> *)scopes
                            contents:(NSString *)contents {
    SCNCodeSnippet *object = [SCNCodeSnippet new];
    object.title = title;
    object.summary = summary;
    object.platform = [self platformWithType:platform];
    object.language = [self languageWithType:language];
    object.shortcut = shortcut;
    object.scopes = [self scopesWithTypes:scopes];
    object.contents = contents;
    return object;
}

#pragma mark - Helper

+ (instancetype)codeSnippetObjCWithTitle:(NSString *)title
                                shortcut:(NSString *)shortcut
                                  scopes:(NSArray<NSNumber *> *)scopes
                                contents:(NSString *)contents {
    return [[self class] codeSnippetWithTitle:title
                                      summary:nil
                                     platform:kSCNCodeSnippetPlatformAll
                                     language:kSCNCodeSnippetLanguageObjC
                                     shortcut:shortcut
                                       scopes:scopes
                                     contents:contents];
}

+ (NSString *)languageWithType:(kSCNCodeSnippetLanguage)type {
    switch (type) {
        case kSCNCodeSnippetLanguageObjC:
            return SCNCodeSnippetLanguageObjC;
        case kSCNCodeSnippetLanguageSwift:
            return SCNCodeSnippetLanguageSwift;
    }
}

+ (NSString *)platformWithType:(kSCNCodeSnippetPlatform)type {
    switch (type) {
        case kSCNCodeSnippetPlatformiOS:
            return SCNCodeSnippetPlatformiOS;
        case kSCNCodeSnippetPlatformAll:
            return nil;
    }
}

+ (NSString *)scopeWithType:(kSCNCodeSnippetScope)type {
    switch (type) {
        case kSCNCodeSnippetScopeClassImplementation:
            return SCNCodeSnippetScopeClassImplementation;
        case kSCNCodeSnippetScopeClassInterfaceVariables:
            return SCNCodeSnippetScopeClassInterfaceVariables;
        case kSCNCodeSnippetScopeClassInterfaceMethods:
            return SCNCodeSnippetScopeClassInterfaceMethods;
        case kSCNCodeSnippetScopeCodeExpression:
            return SCNCodeSnippetScopeCodeExpression;
        case kSCNCodeSnippetScopeCodeBlock:
            return SCNCodeSnippetScopeCodeBlock;
        case kSCNCodeSnippetScopePreprocessor:
            return SCNCodeSnippetScopePreprocessor;
        case kSCNCodeSnippetScopeStringOrComment:
            return SCNCodeSnippetScopeStringOrComment;
        case kSCNCodeSnippetScopeTopLevel:
            return SCNCodeSnippetScopeTopLevel;
        case kSCNCodeSnippetScopeAll:
            return SCNCodeSnippetScopeAll;
    }
}

+ (NSArray<NSString *> *)scopesWithTypes:(NSArray<NSNumber *> *)types {
    NSMutableArray *scopes = [NSMutableArray arrayWithCapacity:types.count];
    for (NSNumber *type in types) {
        [scopes addObject:[self scopeWithType:type.integerValue]];
    }
    return [scopes copy];
}

#pragma mark - Object to NSDictionary

- (NSDictionary *)toDictionary {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:self.shortcut forKey:@"IDECodeSnippetCompletionPrefix"];
    [dictionary setObject:self.scopes forKey:@"IDECodeSnippetCompletionScopes"];
    [dictionary setObject:self.contents forKey:@"IDECodeSnippetContents"];
    [dictionary setObject:self.identifier forKey:@"IDECodeSnippetIdentifier"];
    [dictionary setObject:self.language forKey:@"IDECodeSnippetLanguage"];
    if (self.platform) {
        [dictionary setObject:self.platform forKey:@"IDECodeSnippetPlatformFamily"];
    }
    [dictionary setObject:self.title forKey:@"IDECodeSnippetTitle"];
    if (self.summary) {
        [dictionary setObject:self.summary forKey:@"IDECodeSnippetSummary"];
    }
    [dictionary setObject:@(self.isUserSnippet) forKey:@"IDECodeSnippetUserSnippet"];
    [dictionary setObject:@(self.version) forKey:@"IDECodeSnippetVersion"];
    return [dictionary copy];
}

@end

