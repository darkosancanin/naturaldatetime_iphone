#import <UIKit/UIKit.h>
#import "ExamplesControllerDelegate.h"

@interface ExamplesController : UITableViewController{
    id<ExamplesControllerDelegate> delegate;
    NSMutableDictionary *sectionHeaderViews;
}

@property (nonatomic, assign) id<ExamplesControllerDelegate> delegate;
@property (nonatomic, retain) NSMutableDictionary *sectionHeaderViews;

@end
