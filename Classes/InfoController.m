#import "InfoController.h"
#import "ApplicationSettings.h"

@implementation InfoController

@synthesize versionTextView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"About";
    versionTextView.text = [NSString stringWithFormat:@"Version %@", VERSION];
}

- (IBAction) webClicked{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:WEBSITE_URL]];
}

- (IBAction) emailClicked{
    MFMailComposeViewController *emailController = [[MFMailComposeViewController alloc] init];
    emailController.mailComposeDelegate = self;
    [emailController setSubject:APPLICATION_NAME];
    [emailController setToRecipients:[NSArray arrayWithObject:EMAIL_ADDRESS]];
    [self presentModalViewController:emailController animated:YES];
    [emailController release];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error;
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction) twitterClicked{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:TWITTER_URL]];
}

- (void)dealloc{
    [versionTextView release];
    [super dealloc];
}

@end
