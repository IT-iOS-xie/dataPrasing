
#import "SYYModelCoordinator.h"
#import "SYYJSonToObjectBuilder.h"
#import "SYYCoordinatorModel.h"
#import <objc/message.h>


#define AFWEBAPI_REQUEST_TIMEOUT 20

@implementation SYYModelCoordinator
-(instancetype) init
{
    if (self = [super init]) {
        model_ = [[SYYCoordinatorModel alloc]init];
        
        
    }
    
    return self;
}


+(SYYModelCoordinator *)sharedManager
{
    static SYYModelCoordinator *manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager = [[self alloc]init];
        
    });
    
    return manager;
}


//- (void) getRecommendedInfo:(SYY_RECOMMENDED_INFO_TYPE) type uid:(int)uid
//                  timestamp:(NSInteger)timestamp
//         getInfoUseBlocking:(void (^)(id response))getInfoUseBlocking
//      getFailureUseBlocking:(void (^)(id error))getFailureUseBlocking
//{
//    AFNetworkReachabilityManager * mgr = [AFNetworkReachabilityManager sharedManager];
//    
//    if (kAppDelegate.SYYNETSTATUS != 0 && mgr.networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable ){
//        
//        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
//        manager.requestSerializer=[AFJSONRequestSerializer serializer];
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html" ,@"text/plain",nil];
//        
//        NSString *url_string;
//        //        if (app.isLogin) {
//        url_string = [NSString stringWithFormat:@"%@%@",INTERFACEKURL,INTERFACEGRI];
//        NSDictionary * paramaters = @{@"tp":[NSString stringWithFormat:@"%zd",type],@"tm":[NSString stringWithFormat:@"%ld",timestamp],@"uid":[NSString stringWithFormat:@"%zd",uid]};
//        
//        [manager GET:url_string parameters:paramaters  progress:^(NSProgress * _Nonnull downloadProgress) {
//            
//        }
//             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                 
//                 // 保存字典
//                 if (timestamp == 0) {
//                     
//                     [SYYFileCache  deleteLocalCacheDataWithKey:HOMEPAGECACHE];
//                     
//                     [self judgeCacheLimit];
//                     [SYYFileCache  writeLocalCacheData:responseObject withKey:HOMEPAGECACHE andtimestamp:timestamp];
//                 }  else {
//                     
//                     [self judgeCacheLimit];
//                     [SYYFileCache  writeLocalCacheData:responseObject withKey:HOMEPAGECACHE andtimestamp:timestamp];
//                 }
//                 
//                 id<SYYJSonAbstractBuilderInterface> builder = nil;
//                 CREATE_JSON_TO_OBJECT_BUILDER(builder);
//                 SET_BUILDER_CONTAINER(builder, @"SYYJSonRecommendedInfoResponse");
//                 SET_BUILDER_RESOURCE(builder, responseObject);
//                 ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYJSonAdvertisementInfo", @"adv")
//                 ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYHomeMusicianModel", @"musicians")
//                 ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYHomeSongListModel", @"song_list")
//                 ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYHomeAlbumBriefModel", @"album_list")
//                 ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYHomeNew_HotSongModel", @"newest_songs")
//                 ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYHomeNew_HotSongModel", @"hottest_songs")
//                 
//                 id object = GET_RESULT(builder);
//                 
//                 SYYJSonRecommendedInfoResponse* tmp_obj = (SYYJSonRecommendedInfoResponse*)object;
//                 
//                 if (tmp_obj != nil) {
//                     
//                     if (timestamp == 0) [self _clearRecommendedMusicList];
//                     //                     [self _appendRecommendedMusicList: tmp_obj.musics];
//                 }
//                 
//                 dispatch_async(dispatch_get_main_queue(), ^{    getInfoUseBlocking(object);});
//             }
//         
//             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                 
//                 getFailureUseBlocking(error);
//             }
//         ];
//    } else {
//        
//        NSDictionary * dict;
//        
//        if (timestamp == 0) {
//            
//            dict = [SYYFileCache readLocalCacheDataWithKey:HOMEPAGECACHE andTimeScamp:timestamp];
//        }  else {
//            
//            dict = [SYYFileCache readLocalCacheDataWithKey:HOMEPAGECACHE andTimeScamp:timestamp];
//        }
//        
//        id<SYYJSonAbstractBuilderInterface> builder = nil;
//        CREATE_JSON_TO_OBJECT_BUILDER(builder);
//        SET_BUILDER_CONTAINER(builder, @"SYYJSonRecommendedInfoResponse");
//        SET_BUILDER_RESOURCE(builder, dict);
//        ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYJSonAdvertisementInfo", @"adv")
//        ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYHomeMusicianModel", @"musicians")
//        ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYHomeSongListModel", @"song_list")
//        ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYHomeNew_HotSongModel", @"newest_songs")
//        ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"SYYHomeNew_HotSongModel", @"hottest_songs")
//        id object = GET_RESULT(builder);
//        
//        SYYJSonRecommendedInfoResponse* tmp_obj = (SYYJSonRecommendedInfoResponse*)object;
//        
//        dispatch_async(dispatch_get_main_queue(), ^{    getInfoUseBlocking(tmp_obj);});
//        NSError *  error;
//        getFailureUseBlocking(error);
//    }
//}

@end
