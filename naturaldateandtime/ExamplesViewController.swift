import UIKit

class ExamplesViewController: UITableViewController {

	var delegate:ExamplesViewControllerDelegate?

	override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0)
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
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var sectionTitle = ExampleQuestions.sharedInstance.getExampleQuestionsSections()[section].sectionTitle as NSString
        var size = NSString(string: sectionTitle).boundingRectWithSize(CGSize(width: self.tableView.frame.width - 19, height: CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont(name: "Georgia", size: 20)!], context: nil)
        return size.height + 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as! UITableViewCell
		cell.textLabel?.text = ExampleQuestions.sharedInstance.getExampleQuestionsSections()[indexPath.section].questions[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var question = ExampleQuestions.sharedInstance.getExampleQuestionsSections()[indexPath.section].questions[indexPath.row] as NSString
        var size = NSString(string: question).boundingRectWithSize(CGSize(width: self.tableView.frame.width - 19, height: CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont(name: "Georgia", size: 18)!], context: nil)
        return size.height + 10
    }
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
		self.delegate?.didSelectQuestion(ExampleQuestions.sharedInstance.getExampleQuestionsSections()[indexPath.section].questions[indexPath.row])
	}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}