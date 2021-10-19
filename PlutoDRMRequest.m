#import "PlutoDRMRequest.h"

@implementation PlutoDRMRequest



#define API_URL @"https://YOUR_SERVER_HERE"



-(int)SentRequest3zozz {


dispatch_semaphore_t mySemaphore = dispatch_semaphore_create(0);

__block int statusCode;




NSURL *urlDeive = [NSURL URLWithString:[@"http://127.0.0.1:1357/" stringByAppendingPathComponent:@"device"]];
NSMutableURLRequest *requestDevice = [NSMutableURLRequest requestWithURL:urlDeive cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60.0];
[requestDevice setHTTPMethod:@"GET"];
NSData *receivedDataDevice = [NSURLConnection sendSynchronousRequest:requestDevice returningResponse:nil error:nil]?:[NSData data];
NSDictionary *jsonRespDevice = [NSJSONSerialization JSONObjectWithData:receivedDataDevice options:0 error:nil]?:@{};
NSString* udid = jsonRespDevice[@"udid"];
NSString* device = jsonRespDevice[@"device"];

if(udid && device){


NSURL *url = [NSURL URLWithString:@API_URL];
NSMutableURLRequest *PlutoDRMRequest = [NSMutableURLRequest requestWithURL:url];
[PlutoDRMRequest setHTTPMethod:@"POST"];
[PlutoDRMRequest setValue:@"Azozz ALFiras" forHTTPHeaderField:@"Developer"];
[PlutoDRMRequest setValue:@"co.azozzalfiras.*" forHTTPHeaderField:@"Bundleid"];
[PlutoDRMRequest setValue:@"ISB" forHTTPHeaderField:@"Status"];
[PlutoDRMRequest setValue:@"true" forHTTPHeaderField:@"ISB"];
[PlutoDRMRequest setValue:@"LoginTrue" forHTTPHeaderField:@"3zozz"];
[PlutoDRMRequest setValue:@"exit" forHTTPHeaderField:@"if(Crash => YES)"];
[PlutoDRMRequest setValue:@"azfLibrary" forHTTPHeaderField:@"Manager Request"];

NSData *ISB_CheckData = [NSJSONSerialization dataWithJSONObject:@{@"udid": udid?:@"",	@"deviceModel": device?:@""} options:0 error:nil];
[PlutoDRMRequest setHTTPBody:ISB_CheckData];

NSData *azf_ResponseBody       = [NSURLConnection sendSynchronousRequest:PlutoDRMRequest returningResponse:nil error:nil];
NSDictionary *azf_JsonResponse = [NSJSONSerialization JSONObjectWithData:azf_ResponseBody options:0 error:nil]?:@{};


NSString *AlertText = azf_JsonResponse[@"AlertText"];
NSString *StatusText = azf_JsonResponse[@"StatusText"];
NSString *Status3zozz = azf_JsonResponse[@"Status3zozz"];
NSString *status = azf_JsonResponse[@"status"];

if(([Status3zozz isEqualToString:@"completed"]) && ([StatusText isEqualToString:@"Yeah"])){

statusCode = 0;

} else{

statusCode = 1;

}

dispatch_semaphore_signal(mySemaphore);
dispatch_semaphore_wait(mySemaphore, DISPATCH_TIME_FOREVER);
return statusCode;

}

@end
