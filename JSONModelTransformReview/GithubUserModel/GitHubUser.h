//
//  GitHubUser.h
//  ModelBenchmark
//
//  Created by ibireme on 15/9/18.
//  Copyright (c) 2015 ibireme. All rights reserved.
//

#import "YYModel.h"
#import "MJExtension.h"


/// YYModel GHUser
@interface YYGHUser : NSObject <NSCoding>
@property (nonatomic, strong) NSString *login;
@property (nonatomic, assign) UInt64 userID;
@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *gravatarID;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *htmlURL;
@property (nonatomic, strong) NSString *followersURL;
@property (nonatomic, strong) NSString *followingURL;
@property (nonatomic, strong) NSString *gistsURL;
@property (nonatomic, strong) NSString *starredURL;
@property (nonatomic, strong) NSString *subscriptionsURL;
@property (nonatomic, strong) NSString *organizationsURL;
@property (nonatomic, strong) NSString *reposURL;
@property (nonatomic, strong) NSString *eventsURL;
@property (nonatomic, strong) NSString *receivedEventsURL;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) BOOL siteAdmin;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *blog;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *hireable;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, assign) UInt32 publicRepos;
@property (nonatomic, assign) UInt32 publicGists;
@property (nonatomic, assign) UInt32 followers;
@property (nonatomic, assign) UInt32 following;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSValue *test;

@property (nonatomic, strong) NSString *dj_test100;
@property (nonatomic, assign) UInt32 dj_test200;
@property (nonatomic, strong) NSValue *dj_test300;

@end



/// MJExtension GHUser
@interface MJGHUser : NSObject <NSCoding>
@property (nonatomic, strong) NSString *login;
@property (nonatomic, assign) UInt64 userID;
@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *gravatarID;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *htmlURL;
@property (nonatomic, strong) NSString *followersURL;
@property (nonatomic, strong) NSString *followingURL;
@property (nonatomic, strong) NSString *gistsURL;
@property (nonatomic, strong) NSString *starredURL;
@property (nonatomic, strong) NSString *subscriptionsURL;
@property (nonatomic, strong) NSString *organizationsURL;
@property (nonatomic, strong) NSString *reposURL;
@property (nonatomic, strong) NSString *eventsURL;
@property (nonatomic, strong) NSString *receivedEventsURL;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) BOOL siteAdmin;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *blog;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *hireable;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, assign) UInt32 publicRepos;
@property (nonatomic, assign) UInt32 publicGists;
@property (nonatomic, assign) UInt32 followers;
@property (nonatomic, assign) UInt32 following;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSValue *test;

@property (nonatomic, strong) NSString *dj_test100;
@property (nonatomic, assign) UInt32 dj_test200;
@property (nonatomic, strong) NSValue *dj_test300;

@end
