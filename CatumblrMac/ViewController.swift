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
    @IBOutlet weak var BlogCaption: NSTextField!
    @IBOutlet weak var Preview: NSImageView!
    
    var weather_string : NSString = "+0"

    
    let weatherRequest : URLStringConvertible = "http://www.myweather2.com/developer/forecast.ashx?uac=pP9Pz3soUU&output=json&query=%2049.425267,%2032.063599&temp_unit=c"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.getWeather()
       
        

        

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func getWeather () -> ()
    {
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
            
            .responseJSON { (req, res, text, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                    println(req)
                    println(res)
                }
                else {
                    var weather_json = JSON(text!)
                    println(text)
                    println(weather_json)
                    println(weather_json["weather"]["curren_weather"][0]["weather_text"])
                    
                    self.weather_string = weather_json["weather"]["curren_weather"][0]["temp"].string! + " " + weather_json["weather"]["curren_weather"][0]["weather_text"].string!
                    self.TempLabel.stringValue = self.weather_string
                }
        }
        
        
    }
    
    @IBAction func ImageSelected(sender: AnyObject) {
        
        let panel =  NSOpenPanel() as NSOpenPanel
        panel.canChooseDirectories = false
        panel.canChooseFiles = true
        panel.canCreateDirectories = false
        
        panel.beginWithCompletionHandler({ (res: NSInteger) in
           println("dsfsadf")
           println(panel.URL)
            let im = NSImage.self.init(byReferencingURL: panel.URL!) as NSImage
            self.Preview.image = im
        })
        
        
        
    }
    @IBAction func pressAction(btnOpr: NSButton)
    {
        println("Hello From me")
        TempLabel.stringValue  = "Sending..."
        
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
        
        var post_text : NSString = ""
        
        post_text = self.weather_string + " " + BlogCaption.stringValue
        
        let tags = "CatumblrMac ," + NSHost.currentHost().localizedName!
        
        let params : [NSString : NSString]? = ["type":"text", "body": post_text, "caption": "caption", "tags":tags]
       
        
        tumblrCl.post("geekhost", type: "text", parameters: params!, callback: { (id : AnyObject!, err : NSError!) in
            if ((err?) != nil)
            {
                print ("Unable to post message")
            }
            else
            {
                println("Message Send")
                self.TempLabel.stringValue = "Message sent!"
            }
        })
  }

}