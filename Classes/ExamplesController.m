#import "ExamplesController.h"
#import "ExampleQuestionsManager.h"
#import "ExampleQuestionSection.h"

@implementation ExamplesController

@synthesize delegate, sectionHeaderViews;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Examples";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [ExampleQuestionsManager exampleQuestionSections].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    ExampleQuestionSection *exampleQuestionSection = [[ExampleQuestionsManager exampleQuestionSections] objectAtIndex:section];
    return exampleQuestionSection.questions.count; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
    static NSString *CellIdentifier = @"Cell"; 
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
    if (cell == nil) { 
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease]; 
        cell.backgroundView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,10,270,10)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"Georgia" size:18];
        label.textColor = [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1];
        label.lineBreakMode = UILineBreakModeWordWrap;
        label.numberOfLines = 0;
        label.tag = 100;
        [cell addSubview:label];
        [label release];
    } 
    
    ExampleQuestionSection *exampleQuestionSection = [[ExampleQuestionsManager exampleQuestionSections] objectAtIndex:indexPath.section];
    NSString *question = [exampleQuestionSection.questions objectAtIndex:indexPath.row];
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text = question;
    CGSize expectedLabelSize = [question sizeWithFont:label.font constrainedToSize:CGSizeMake(270,9999) lineBreakMode:UILineBreakModeWordWrap]; 
    label.frame = CGRectMake(10, 9, 270, expectedLabelSize.height);
    cell.frame = CGRectMake(0, 0, 320, expectedLabelSize.height + 9);
    
    return cell; 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExampleQuestionSection *exampleQuestionSection = [[ExampleQuestionsManager exampleQuestionSections] objectAtIndex:indexPath.section];
    NSString *question = [exampleQuestionSection.questions objectAtIndex:indexPath.row];
    CGSize expectedLabelSize = [question sizeWithFont:[UIFont fontWithName:@"Georgia" size:18] constrainedToSize:CGSizeMake(270,9999) lineBreakMode:UILineBreakModeWordWrap];     
    return expectedLabelSize.height + 9;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ExampleQuestionSection *exampleQuestionSection = [[ExampleQuestionsManager exampleQuestionSections] objectAtIndex:section];
	
    UIView *headerView = [self.sectionHeaderViews objectForKey:exampleQuestionSection.sectionHeading];
    if(!headerView) {
        headerView = [[[UIView alloc] initWithFrame:CGRectMake(0,0,320,100)] autorelease];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,10,300,10)];
        label.backgroundColor = [UIColor clearColor];
        label.text = exampleQuestionSection.sectionHeading;
        label.font = [UIFont fontWithName:@"Georgia" size:20];
        label.textColor = [UIColor blackColor];
        label.lineBreakMode = UILineBreakModeWordWrap;
        label.numberOfLines = 0;
        CGSize expectedLabelSize = [exampleQuestionSection.sectionHeading sizeWithFont:label.font constrainedToSize:CGSizeMake(300,9999) lineBreakMode:UILineBreakModeWordWrap]; 
        label.frame = CGRectMake(10, 15, 300, expectedLabelSize.height);
        headerView.frame = CGRectMake(0, 0, 320, expectedLabelSize.height + 15);
        [headerView addSubview:label];
        [label release];
        [self.sectionHeaderViews setObject:headerView forKey:exampleQuestionSection.sectionHeading];
    }
    
	return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	ExampleQuestionSection *exampleQuestionSection = [[ExampleQuestionsManager exampleQuestionSections] objectAtIndex:section];
    CGSize expectedLabelSize = [exampleQuestionSection.sectionHeading sizeWithFont:[UIFont fontWithName:@"Georgia" size:20] constrainedToSize:CGSizeMake(300,9999) lineBreakMode:UILineBreakModeWordWrap];     
    return expectedLabelSize.height + 15;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ExampleQuestionSection *exampleQuestionSection = [[ExampleQuestionsManager exampleQuestionSections] objectAtIndex:indexPath.section];
    NSString *question = [exampleQuestionSection.questions objectAtIndex:indexPath.row];
    [self.delegate didSelectQuestion:question];
}

- (void)dealloc{
    self.delegate = nil;
    [sectionHeaderViews release];
    [super dealloc];
}

@end
