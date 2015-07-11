import UIKit

class QuestionViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var questionConstraint: NSLayoutConstraint!
    @IBOutlet weak var outerQuestionTextView: UITextView!
    @IBOutlet weak var questionTextView: UITextView!
    //var questionTextViewHeightConstraint:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpQuestionTextView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpQuestionTextView() {
        self.questionTextView.scrollEnabled = false
        self.outerQuestionTextView.scrollEnabled = false
        self.questionTextView.delegate = self
        self.questionTextView.layer.cornerRadius = 5;
        self.questionTextView.layer.borderWidth = 0;
        self.outerQuestionTextView.layer.cornerRadius = 5;
        self.outerQuestionTextView.layer.borderWidth = 2;
        self.outerQuestionTextView.layer.borderColor = UIColor(red: 167, green: 167, blue: 167, alpha: 1).CGColor
        self.outerQuestionTextView.layer.shadowColor = UIColor.grayColor().CGColor
        self.outerQuestionTextView.layer.shadowOffset = CGSizeZero;
        self.outerQuestionTextView.layer.shadowRadius = 4;
        self.outerQuestionTextView.layer.shadowOpacity = 0.6;
        self.questionTextView.setTranslatesAutoresizingMaskIntoConstraints(false)
        //self.questionTextViewHeightConstraint = NSLayoutConstraint(item: self.questionTextView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0, constant: 300)
        //self.view.addConstraint(self.questionTextViewHeightConstraint)
    }
    
    func textViewDidChange(textView: UITextView) {
        //self.realignElements()
        self.answerTextView.text = self.answerTextView.text + "Blah"
    }
    
    func realignElements(){
        //var current = self.questionConstraint.constant
        //self.questionConstraint.constant = self.questionTextView.sizeThatFits(CGSizeMake(self.questionTextView.frame.size.width, CGFloat.max)).height
        //self.questionTextView.layoutIfNeeded()
        //self.questionTextView.updateConstraints()
        
        //self.questionTextViewHeightConstraint.constant = current + 5
        
        
        //var questionContentHeight = questionTextView.contentSize.height;
        //self.questionTextView.frame = CGRectMake(self.questionTextView.frame.origin.x, self.questionTextView.frame.origin.y, self.questionTextView.frame.size.width, questionContentHeight)
        //self.outerQuestionTextView.frame = CGRectMake(self.outerQuestionTextView.frame.origin.x, self.outerQuestionTextView.frame.origin.y, self.outerQuestionTextView.frame.size.width, questionContentHeight)
    }
}

