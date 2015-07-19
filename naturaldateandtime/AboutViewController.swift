import MessageUI
import UIKit

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
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