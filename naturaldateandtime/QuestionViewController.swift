import UIKit

class QuestionViewController: UIViewController, UITextViewDelegate {
    
	var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var outerQuestionTextView: UITextView!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var outerNotesView: UIScrollView!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
		self.addContentViewWidthConstraints()
        self.updateContentViewHeightConstraint()
		self.setUpTitle()
        self.setupLoadingView()
        self.setUpNoteView()
        self.setUpQuestionTextView()
        //self.hideAll()
    }
    
    func setupLoadingView() {
        var animationImages:[UIImage] = []
        for position in 1...10
        {
            var imageName : String = "Loading\(position)"
            animationImages.append(UIImage(named:imageName)!)
        }
        self.loadingImageView.animationImages = animationImages
        self.loadingImageView.animationDuration = 1.0
        self.loadingImageView.animationRepeatCount = 0
    }
    
    func setUpQuestionTextView() {
        self.questionTextView.delegate = self
        self.questionTextView.layer.cornerRadius = 5;
        self.outerQuestionTextView.layer.cornerRadius = 5;
    }
    
    func setUpNoteView() {
        self.outerNotesView.layer.borderColor = UIColor(red: 250/255, green: 212/255, blue: 46/255, alpha: 1).CGColor
        self.outerNotesView.layer.borderWidth = 2.0
    }
    
    func hideAll() {
        self.answerTextView.hidden = true
        self.loadingImageView.hidden = true
        self.loadingImageView.stopAnimating()
        self.notesTextView.hidden = true
        self.outerNotesView.hidden = true
        //self.noteImage.hidden = true
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
        
        if let constraint = contentViewHeightConstraint {
            self.view.removeConstraint(constraint)
            self.contentViewHeightConstraint.constant = height;
            self.view.addConstraint(contentViewHeightConstraint!)
        }
        else {
            contentViewHeightConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height)
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

