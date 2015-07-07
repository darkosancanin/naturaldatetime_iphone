#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "ExamplesControllerDelegate.h"

@interface QuestionController : UIViewController<UITextViewDelegate, ASIHTTPRequestDelegate, ExamplesControllerDelegate>{
    IBOutlet UITextView *questionTextView;
    IBOutlet UITextView *outerQuestionTextView;
    IBOutlet UITextView *answerTextView;
    UIButton *clearQuestionButton;
    IBOutlet UIButton *examplesButton;
    IBOutlet UIImageView *noteImage;
    IBOutlet UITextView *noteOuterTextView;
    IBOutlet UITextView *noteTextView;
    IBOutlet UILabel *footerLabel;
    ASIFormDataRequest *asiHttpRequest;
    BOOL isShowingSampleQuestion;
    UIImageView* loadingImageView;
}

@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *mainScrollView;
@property (nonatomic, retain) IBOutlet UITextView *questionTextView;
@property (nonatomic, retain) IBOutlet UITextView *outerQuestionTextView;
@property (nonatomic, retain) IBOutlet UITextView *answerTextView;
@property (nonatomic, retain) IBOutlet UIImageView *noteImage;
@property (nonatomic, retain) IBOutlet UITextView *noteOuterTextView;
@property (nonatomic, retain) IBOutlet UITextView *noteTextView;
@property (nonatomic, retain) UIButton *clearQuestionButton;
@property (nonatomic, retain) IBOutlet UIButton *examplesButton;
@property (nonatomic, retain) ASIFormDataRequest *asiHttpRequest;
@property (nonatomic, retain) IBOutlet UILabel *footerLabel;
@property (nonatomic, retain) IBOutlet UIImageView* loadingImageView;

- (IBAction)examplesButtonClicked;
- (void)setUpQuestionTextView;
- (void)setUpInfoButton;
- (void)setUpTitleView;
- (void)showError:(NSError *)error;
- (void)hideAll;
- (void)showAnswer:(NSString *)answerText andNote:(NSString *)note;
- (void)setUpNoteView;
- (void)showRandomQuestion;
- (void)removeSampleQuestion;
- (void)realignElements;
- (void)setupLoadingImage;

@end
