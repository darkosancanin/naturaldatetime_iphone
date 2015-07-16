import UIKit

class QuestionViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        var leftConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(leftConstraint)
        
        var rightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0)
        self.view.addConstraint(rightConstraint)
        
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

