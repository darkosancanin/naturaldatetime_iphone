import UIKit

class ExamplesViewController: UITableViewController {

	var delegate:ExamplesViewControllerDelegate?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ExampleQuestions.sharedInstance.getExampleQuestionsSections().count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExampleQuestions.sharedInstance.getExampleQuestionsSections()[section].questions.count
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCellWithIdentifier("SectionHeaderCell") as! UITableViewCell
        cell.textLabel?.text = ExampleQuestions.sharedInstance.getExampleQuestionsSections()[section].sectionTitle
        return cell
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as! UITableViewCell
		cell.textLabel?.text = ExampleQuestions.sharedInstance.getExampleQuestionsSections()[indexPath.section].questions[indexPath.row]
        return cell
    }
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
		self.delegate?.didSelectQuestion(ExampleQuestions.sharedInstance.getExampleQuestionsSections()[indexPath.section].questions[indexPath.row])
	}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}