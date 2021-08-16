# PlutoDRM
3zozz is an in-between server for PlutoDRM API.



Use this in order to keep your Developer Access Key a secret. 
Please use HTTPS if you are going to use it on your own server.

## Usage

If you're using DRMUtils, you can call import it into your tweaks.

```objective-c
#import "PlutoDRMRequest.h"

```

Make sure you've set up the macros in PlutoDRMRequest.m beforehand.

```objective-c
#define API_URL @"https://YOUR_SERVER_HERE"
```

Calling it is even easier.

```objective-c
PlutoDRMRequest* PlutoDRM = [[PlutoDRMRequest alloc] init];
int returnCode = [PlutoDRM SentRequest3zozz]; 

// Do whatever you will with the return code
if (returnCode == 0) {
  // Purchased!
}
else if (returnCode == 1) {
  // Pirated :(
}

else {
  // An error with the API Occured
}

```
