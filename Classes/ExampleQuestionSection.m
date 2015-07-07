#import "ExampleQuestionSection.h"

@implementation ExampleQuestionSection

@synthesize sectionHeading, questions;


-(void)dealloc{
    [sectionHeading release];
    [questions release];
    [super dealloc];
}

@end
