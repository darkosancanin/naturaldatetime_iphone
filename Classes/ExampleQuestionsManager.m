#import "ExampleQuestionsManager.h"
#import "ExampleQuestionSection.h"

@implementation ExampleQuestionsManager

+ (NSArray *)exampleQuestionSections {
	
	static NSArray *exampleQuestionSections;
	if(exampleQuestionSections == nil){
        
        ExampleQuestionSection *currentTime = [[ExampleQuestionSection alloc] init];
        currentTime.sectionHeading = @"Current time in a city";
        currentTime.questions = [NSArray arrayWithObjects: @"What is the time in New York", @"Time in Belgrade", nil];
		exampleQuestionSections = [NSArray arrayWithObjects: currentTime, nil];
        
        ExampleQuestionSection *timeConversionBetweenCities = [[ExampleQuestionSection alloc] init];
        timeConversionBetweenCities.sectionHeading = @"Time conversions between cities in different timezones";
        timeConversionBetweenCities.questions = [NSArray arrayWithObjects: @"What is the time in Kathmandu, Nepal when it is 7pm in New York, USA", @"If its 4pm in London what is the time in Boston", nil];
		exampleQuestionSections = [NSArray arrayWithObjects: timeConversionBetweenCities, nil];
        
        ExampleQuestionSection *timeConversionBetweenCitiesOnADate = [[ExampleQuestionSection alloc] init];
        timeConversionBetweenCitiesOnADate.sectionHeading = @"Time conversions between cities in different timezones on a particular date";
        timeConversionBetweenCitiesOnADate.questions = [NSArray arrayWithObjects: @"What is the time in Sao Paolo when it is 2:30pm on the 2nd of June in Detroit", @"What time is it in Paris when it is 7-April-2013 in Sydney at 2:30am", nil];
		exampleQuestionSections = [NSArray arrayWithObjects: timeConversionBetweenCitiesOnADate, nil];
        
        ExampleQuestionSection *daylightInfoForCity = [[ExampleQuestionSection alloc] init];
        daylightInfoForCity.sectionHeading = @"Daylight saving information for a city";
        daylightInfoForCity.questions = [NSArray arrayWithObjects: @"When does daylight saving time begin in Auckland", nil];
		exampleQuestionSections = [NSArray arrayWithObjects: daylightInfoForCity, nil];
        
        ExampleQuestionSection *daylightInfoForCityForYear = [[ExampleQuestionSection alloc] init];
        daylightInfoForCityForYear.sectionHeading = @"Daylight saving information for a city for a specific year";
        daylightInfoForCityForYear.questions = [NSArray arrayWithObjects: @"When does daylight saving time begin in New York in 2013", nil];
		
        exampleQuestionSections = [NSArray arrayWithObjects: currentTime, timeConversionBetweenCities, timeConversionBetweenCitiesOnADate, daylightInfoForCity, daylightInfoForCityForYear, nil];
        
        [currentTime release];
        [timeConversionBetweenCities release];
        [timeConversionBetweenCitiesOnADate release];
        [daylightInfoForCity release];
        [daylightInfoForCityForYear release];
		
		[exampleQuestionSections retain];
	}
	
	return exampleQuestionSections;
}

+ (NSString *)randomExampleQuestion{
    NSArray *exampleQuestionSections = [self exampleQuestionSections];
    NSUInteger randomIndex = arc4random() % [exampleQuestionSections count];
    ExampleQuestionSection *randomExampleQuestionSection = [exampleQuestionSections objectAtIndex:randomIndex];
    randomIndex = arc4random() % [randomExampleQuestionSection.questions count];
    NSString *randomQuestion = [randomExampleQuestionSection.questions objectAtIndex:randomIndex];
    return randomQuestion;
}

@end
