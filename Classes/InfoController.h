#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MessageUI.h> 

@interface InfoController : UIViewController<MFMailComposeViewControllerDelegate>{
    IBOutlet UITextView *versionTextView;
}

@property (nonatomic, retain) IBOutlet UITextView *versionTextView;

- (IBAction) webClicked;
- (IBAction) emailClicked;
- (IBAction) twitterClicked;

@end
