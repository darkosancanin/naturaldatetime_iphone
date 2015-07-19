import MessageUI
import UIKit

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var aboutTextViewHeightConstraint: NSLayoutConstraint!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        //self.aboutTextViewHeightConstraint.constant = self.aboutTextView.contentSize.height
        //self.aboutTextView.sizeToFit()
    }
	
	@IBAction func didClickOnWebsiteButton(sender: AnyObject) {
		UIApplication.sharedApplication().openURL(NSURL(string: "http://www.naturaldateandtime.com")!)
    }
	
    @IBAction func didClickOnEmailButton(sender: AnyObject) {
		var mailComposeViewController: MFMailComposeViewController = MFMailComposeViewController()
		mailComposeViewController.mailComposeDelegate = self
		mailComposeViewController.setSubject("Natural Date and Time")
		mailComposeViewController.setToRecipients(["darko@darkosancanin.com"])
		self.presentViewController(mailComposeViewController, animated: true, completion: nil)
    }

    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}