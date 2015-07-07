#import <Foundation/Foundation.h>

@interface ExampleQuestionSection : NSObject{
    NSString *sectionHeading;
    NSArray *questions;
}

@property (nonatomic, retain) NSString *sectionHeading;
@property (nonatomic, retain) NSArray *questions;

@end
