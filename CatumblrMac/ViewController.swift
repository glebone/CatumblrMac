//
//  ViewController.swift
//  CatumblrMac
//
//  Created by gleb on 11/21/14.
//  Copyright (c) 2014 gleb. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

     
    
    @IBOutlet weak var TempLabel: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func pressAction(btnOpr: NSButton)
    {
        println("Hello From me")
        TempLabel.stringValue  = "-100"
        
        
        let requestSerializer = AFJSONRequestSerializer() as AFJSONRequestSerializer
        let responseSerializer = AFJSONResponseSerializer() as AFJSONResponseSerializer
        let tumblrCl = TMAPIClient.sharedInstance() as TMAPIClient
        let jxhhtpop = JXHTTPOperation() as JXHTTPOperation
        
        tumblrCl.OAuthConsumerKey = "sYKNnjJRqbxWWlg19sY8WYnZyQi6wURbilnE4k3vsyqX4vc4ER"
        tumblrCl.OAuthConsumerSecret = "n8mtWzKieR8qgTdwUWNhF3OYZVIsvMZXvVr9DKPlCGI6wE2VLV"
        tumblrCl.OAuthToken = "PyvcruFPx1YqhdAOkCWjCPWMBIYx3fUJaiFzjhxpkwUwps0VjC"
        tumblrCl.OAuthTokenSecret = "Zjwmi2wYA83rtIdoL82BcWcj5sxm5QrI1MEnZX4DzFQHWydx1C"
        
        let params : [NSString : NSString]? = ["type":"text", "body": "Sample text", "caption": "caption", "tags":"tags"]
       
        
        tumblrCl.post("geekhost", type: "text", parameters: params!, callback: { (id : AnyObject!, err : NSError!) in
            
            println("Message Send")
            
        }        )


  }

}