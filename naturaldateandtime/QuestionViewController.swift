import UIKit

class QuestionViewController: UIViewController, UITextViewDelegate {
    
	var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var outerQuestionTextView: UITextView!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var outerNotesView: UIScrollView!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
		self.addContentViewWidthConstraints()
        self.updateContentViewHeightConstraint()
		self.setUpTitle()
    }
    
    func setUpTitle(){
        var titleImage = UIImage(named: "Title")
        var titleImageView = UIImageView(image: titleImage)
        self.navigationItem.titleView = titleImageView
    }
	
	func addContentViewWidthConstraints(){
		var leftConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(leftConstraint)
        
        var rightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0)
        self.view.addConstraint(rightConstraint)
	}
	
	func updateContentViewHeightConstraint(){
        var maxHeight = self.view.frame.size.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.sharedApplication().statusBarFrame.size.height
        var height = self.scrollView.frame.size.height;
        if (height > maxHeight) {
            height = maxHeight;
        }
        
        if let constraint = heightConstraint {
            self.view.removeConstraint(constraint)
            self.heightConstraint.constant = height;
            self.view.addConstraint(heightConstraint!)
        }
        else {
            heightConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height)
        }
	}
	
	override func viewWillLayoutSubviews() {
        self.updateContentViewHeightConstraint()
        super.viewWillLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

