#import "QuestionController.h"
#import "QuartzCore/QuartzCore.h"
#import "InfoController.h"
#import "ExamplesController.h"
#import "NSString+EncodeUrl.h"
#import "NSDictionary_JSONExtensions.h"
#import "ExampleQuestionsManager.h"
#import "ApplicationSettings.h"
#import "NSString+md5.h"

@implementation QuestionController

@synthesize mainScrollView, questionTextView, outerQuestionTextView, asiHttpRequest, answerTextView, examplesButton, clearQuestionButton, noteImage, noteOuterTextView, noteTextView, footerLabel, loadingImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpQuestionTextView];
    [self setupLoadingImage];
    [self setUpInfoButton];
    [self setUpTitleView];
    [self setUpNoteView];
    [self hideAll];
    [self showRandomQuestion];
    [self realignElements];
}

- (void)setUpNoteView{
    self.noteOuterTextView.layer.borderColor = CGColorRetain([[UIColor colorWithRed:250/255.f green:212/255.f blue:46/255.f alpha:1.0] CGColor]);
    self.noteOuterTextView.layer.borderWidth = 2.0f;
}

- (void)setupLoadingImage{
    loadingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 120, 24)];
    loadingImageView.animationImages = [NSArray arrayWithObjects:    
                                         [UIImage imageNamed:@"loading1.png"],
                                         [UIImage imageNamed:@"loading2.png"],
                                         [UIImage imageNamed:@"loading3.png"],
                                         [UIImage imageNamed:@"loading4.png"],
                                         [UIImage imageNamed:@"loading5.png"],
                                         [UIImage imageNamed:@"loading6.png"],
                                         [UIImage imageNamed:@"loading7.png"],
                                         [UIImage imageNamed:@"loading8.png"],
                                         [UIImage imageNamed:@"loading9.png"],
                                         [UIImage imageNamed:@"loading10.png"], nil];
    loadingImageView.animationDuration = 1.0f;
    loadingImageView.animationRepeatCount = 0;
    [self.view addSubview: loadingImageView];
}

- (void)setUpTitleView{
    UIImage *titleImage = [UIImage imageNamed:@"naturaldateandtime.png"];
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    self.navigationItem.titleView = titleImageView;
    [titleImageView release];
}

- (void)setUpInfoButton{
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
	[infoButton addTarget:self action:@selector(infoButtonClicked) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *infoButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
	self.navigationItem.rightBarButtonItem = infoButtonItem;	
	[infoButton release];
}

- (void)infoButtonClicked{
    InfoController *infoController = [[InfoController alloc] initWithNibName:@"Info" bundle:nil];
    [self.navigationController pushViewController:infoController animated:YES];
    [infoController release];
}

- (void)setUpQuestionTextView{
    self.questionTextView.delegate = self;
    self.questionTextView.returnKeyType = UIReturnKeyGo;
    self.questionTextView.layer.cornerRadius = 5;
    self.questionTextView.layer.borderWidth = 0;
    self.outerQuestionTextView.layer.cornerRadius = 5;
    self.outerQuestionTextView.layer.borderWidth = 2;
    self.outerQuestionTextView.layer.borderColor = [[UIColor colorWithRed:167 green:167 blue:167 alpha:1] CGColor];
    self.outerQuestionTextView.layer.shadowColor = [[UIColor grayColor] CGColor];
    self.outerQuestionTextView.layer.shadowOffset = CGSizeZero;
    self.outerQuestionTextView.layer.shadowRadius = 4;
    self.outerQuestionTextView.layer.shadowOpacity = 0.6;
    
    UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.clearQuestionButton = clearButton;
    [clearButton release];
    [clearQuestionButton setImage:[UIImage imageNamed:@"clear_question.png"] forState:UIControlStateNormal];
    [self.clearQuestionButton addTarget:self action:@selector(clearQuestionButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.outerQuestionTextView addSubview:self.clearQuestionButton];
}

- (void)showRandomQuestion{
    self.questionTextView.text = [NSString stringWithFormat:@"e.g. %@", [ExampleQuestionsManager randomExampleQuestion]];
    self.questionTextView.textColor = [UIColor lightGrayColor];
    isShowingSampleQuestion = YES;
    self.questionTextView.selectedRange = NSMakeRange(0, 0); 
    [self.questionTextView becomeFirstResponder];
}

-(void)clearQuestionButtonPressed{
    self.questionTextView.text = @"";
    [self hideAll];
    [self showRandomQuestion];
    [self realignElements];
}

-(void)realignElements{
    CGFloat questionContentHeight = questionTextView.contentSize.height;
    [questionTextView setFrame:CGRectMake([questionTextView frame].origin.x, [questionTextView frame].origin.y, [questionTextView frame].size.width, questionContentHeight)];
    [outerQuestionTextView setFrame:CGRectMake([outerQuestionTextView frame].origin.x, [outerQuestionTextView frame].origin.y, [outerQuestionTextView frame].size.width, questionContentHeight)];
    CGFloat clearButtonX = [outerQuestionTextView frame].origin.x + [outerQuestionTextView frame].size.width - 50;
    [self.clearQuestionButton setFrame:CGRectMake(clearButtonX, (questionContentHeight/2) - 15, 30, 30)];
    
    CGFloat yExamplePosition = questionTextView.frame.origin.y + questionTextView.frame.size.height + 10;
    [examplesButton setFrame:CGRectMake(examplesButton.frame.origin.x, yExamplePosition, examplesButton.frame.size.width, examplesButton.frame.size.height)];
    
    if(answerTextView.hidden == NO){
        CGFloat answerContentHeight = answerTextView.contentSize.height;
        CGFloat answerYPosition = self.questionTextView.frame.origin.y + self.questionTextView.frame.size.height + 40;
        self.answerTextView.frame = CGRectMake(self.answerTextView.frame.origin.x, answerYPosition, self.answerTextView.frame.size.width, answerContentHeight);
        if(noteTextView.hidden == NO){
            CGFloat noteContentHeight = noteTextView.contentSize.height;
            CGFloat noteYPosition = answerYPosition + answerContentHeight + 20;
            self.noteOuterTextView.frame = CGRectMake(self.noteOuterTextView.frame.origin.x, noteYPosition, self.noteOuterTextView.frame.size.width, noteContentHeight);
            self.noteTextView.frame = CGRectMake(self.noteTextView.frame.origin.x, noteYPosition, self.noteTextView.frame.size.width, noteContentHeight);
            
            CGFloat noteImageYPosition = (self.noteOuterTextView.frame.size.height/2) - 15 + self.noteOuterTextView.frame.origin.y;
            self.noteImage.frame = CGRectMake(self.noteImage.frame.origin.x, noteImageYPosition, 30, 30);
        }
    }
    
    if(loadingImageView.hidden == NO){
        CGFloat yLoadingImageViewPosition = self.questionTextView.frame.origin.y + self.questionTextView.frame.size.height + 50;
        self.loadingImageView.frame = CGRectMake(self.loadingImageView.frame.origin.x, yLoadingImageViewPosition, self.loadingImageView.frame.size.width, self.loadingImageView.frame.size.height);
    }
    
    CGFloat footerYPosition = 390;
    
    UIView *bottomElement;
    if(noteTextView.hidden == NO)
        bottomElement = noteTextView;
    else if(answerTextView.hidden == NO)
        bottomElement = answerTextView;
    else if(loadingImageView.hidden == NO)
        bottomElement = loadingImageView;
    else
        bottomElement = examplesButton;
    
    CGFloat endOfBottomElement = bottomElement.frame.origin.y + bottomElement.frame.size.height;
    if(endOfBottomElement > (footerYPosition - 20))
        footerYPosition = endOfBottomElement + 20;
    
    self.footerLabel.frame = CGRectMake(self.footerLabel.frame.origin.x, footerYPosition, self.footerLabel.frame.size.width, self.footerLabel.frame.size.height);
    self.mainScrollView.contentSize = CGSizeMake(320, footerYPosition + 30);
    
    if(answerTextView.hidden == NO){
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        self.mainScrollView.contentOffset = CGPointMake(0, self.mainScrollView.contentSize.height - 420);
        [UIView commitAnimations];
    }
}

- (void)getAnswer{
    [self hideAll];
    [self.questionTextView resignFirstResponder];    
    self.loadingImageView.hidden = NO;
    [self.loadingImageView startAnimating];
    [self realignElements];
    
    [self.asiHttpRequest cancel];
	self.asiHttpRequest = nil;
    NSString *url = [NSString stringWithFormat:@"%@/answer", API_URL];
    NSURL *nsUrl = [NSURL URLWithString:url];
	self.asiHttpRequest = [ASIFormDataRequest requestWithURL:nsUrl];
    NSString *securityToken = [[NSString stringWithFormat:@"%@%@", self.questionTextView.text, API_SECURITY_TOKEN_SALT] md5];
    [self.asiHttpRequest setPostValue:securityToken forKey:@"token"];
    [self.asiHttpRequest setPostValue:self.questionTextView.text forKey:@"q"];
    [self.asiHttpRequest setPostValue:CLIENT forKey:@"client"];
    [self.asiHttpRequest setPostValue:VERSION_URLFORMATTED forKey:@"version"];
    self.asiHttpRequest.delegate = self;
	[self.asiHttpRequest startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request{
    [self hideAll];
    NSString *responseString = [request responseString];
	NSError *error;
	NSDictionary *responseDictionary = (NSDictionary *)[NSDictionary dictionaryWithJSONString:responseString error:&error];
	if(!responseDictionary){
		[self showError:error];
        return;
    }
    NSString *answerText = [responseDictionary objectForKey:@"answer_text"];
    BOOL understoodQuestion = [[responseDictionary objectForKey:@"understood_question"] boolValue];
    NSString *note = [responseDictionary objectForKey:@"note"];
    if(understoodQuestion){
        [self showAnswer:answerText andNote:note];
    }
    else{
        [self showAnswer:@"Im sorry I could not understand your question. Please try and rephrase your question or tap on the examples link above to see what questions I do understand." andNote:nil];
    }
}

- (void)showAnswer:(NSString *)answerText andNote:(NSString *)note{
    self.answerTextView.text = answerText;
    self.answerTextView.hidden = NO;
    if(note != nil && (NSNull *)note != [NSNull null] && note.length > 0){
        self.noteTextView.text = note;
        self.noteOuterTextView.hidden = NO;
        self.noteTextView.hidden = NO;
        self.noteImage.hidden = NO;
    }
    [self realignElements];
}

- (void)hideAll{
    self.answerTextView.hidden = YES;
    self.loadingImageView.hidden = YES;
    [self.loadingImageView stopAnimating];
    self.noteOuterTextView.hidden = YES;
    self.noteTextView.hidden = YES;
    self.noteImage.hidden = YES;
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    [self hideAll];
	NSError *error = [request error];
    [self showError:error];
}

- (void)showError:(NSError *)error{
    NSLog(@"Error: %@", [error localizedDescription]);
    NSString *friendlyError = @"Oops. Something went wrong. Please try again.";
    NSRange range = [[error localizedDescription] rangeOfString:@"A connection failure occurred" options:NSCaseInsensitiveSearch];
    if(range.location != NSNotFound) {
        friendlyError = @"Oops. No connection available. Please check your internet connection.";
    }
    [self showAnswer:friendlyError andNote:nil];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
{
    [self hideAll];
    if ([text isEqualToString:@"\n"]) {
        if(!isShowingSampleQuestion)
            [self getAnswer];
        return NO;
    }
    [self removeSampleQuestion];
    self.questionTextView.textColor = [UIColor blackColor];
    return YES;
}

- (void)removeSampleQuestion{
    if(isShowingSampleQuestion){
        isShowingSampleQuestion = NO;
        self.questionTextView.text = @"";
    }
}

- (IBAction)examplesButtonClicked{
    ExamplesController *examplesController = [[ExamplesController alloc] initWithNibName:@"Examples" bundle:nil];
    examplesController.delegate = self;
    [self.navigationController pushViewController:examplesController animated:YES];
    [examplesController release];
}

- (void)textViewDidChange:(UITextView *)textView{
    if(textView.text.length == 0){
        [self showRandomQuestion];
    } 
    [self realignElements];
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    if(textView.selectedRange.location > 0 && isShowingSampleQuestion)
        textView.selectedRange = NSMakeRange(0, 0); 
}

- (void)didSelectQuestion:(NSString *)question{
    [self.navigationController popViewControllerAnimated:YES];
    [self removeSampleQuestion];
    self.questionTextView.text = question;
    self.questionTextView.textColor = [UIColor blackColor];
    [self getAnswer];
}

- (void)dealloc{
    [questionTextView release];
    [mainScrollView release];
    [outerQuestionTextView release];
    [asiHttpRequest release];
    [answerTextView release];
    [examplesButton release];
    [clearQuestionButton release];
    [noteImage release];
    [noteOuterTextView release];
    [noteTextView release];
    [footerLabel release];
    [loadingImageView release];
    [super dealloc];
}

@end
