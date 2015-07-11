//
//  ViewController.swift
//  naturaldateandtime
//
//  Created by Darko Sancanin on 11/07/2015.
//  Copyright (c) 2015 darkosancanin.com. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var TestLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TestLabel.text = "Blah Blah blah"
        
        //UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
        //[infoButton addTarget:self action:@selector(infoButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        //UIBarButtonItem *infoButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
        //self.navigationItem.rightBarButtonItem = infoButtonItem;
        //[infoButton release];
        
        //let infoButton: UIButton = UIButton.buttonWithType(UIButtonType.InfoLight) as! UIButton
        //infoButton.frame = CGRectMake(0, 0, 40, 40)
        //infoButton.addTarget(self, action: "rightNavItemEditClick", forControlEvents: UIControlEvents.TouchUpInside)
        //var rightBarButtonInfoButton: UIBarButtonItem = UIBarButtonItem(customView: infoButton)
        //self.navigationItem.setRightBarButtonItem(rightBarButtonInfoButton, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rightNavItemEditClick(sender:UIButton!)
    {
        self.performSegueWithIdentifier("AboutSegue", sender: nil)
        println("rightNavItemEditClick")
    }


}

