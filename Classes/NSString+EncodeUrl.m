#import "NSString+EncodeUrl.h"

@implementation NSString (EncodeUrl)

- (NSString *) urlEncoded {
    return (NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 );
}

@end
