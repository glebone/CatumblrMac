//
//  ViewController.swift
//  CatumblrMac
//
//  Created by gleb on 11/21/14.
//  Copyright (c) 2014 gleb. All rights reserved.
//

import Cocoa
import Alamofire
import SwiftyJSON

class ViewController: NSViewController {

     
    
    @IBOutlet weak var TempLabel: NSTextField!
    
    let weatherRequest : URLStringConvertible = "http://www.myweather2.com/developer/forecast.ashx?uac=pP9Pz3soUU&output=json&query=%2049.425267,%2032.063599&temp_unit=c"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, weatherRequest, parameters: ["":""])
            .response { (request, response, data, error) in
                println(request)
                println(response)
                println(data)
                println(error)
                //let json : JSON =
                
        }
        
        .responseString { (_, _, text, _) in
                println(text)
            //let json = JSON(data: text)
            
        }
        

        

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
        
        Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
            .response { (request, response, data, error) in
                println(request)
                println(response)
                println(error)
        }
        
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
            if ((err?) != nil)
            {
                print ("Unable to post message")
            }
            else
            {
                println("Message Send")
            }
        })
  }

}