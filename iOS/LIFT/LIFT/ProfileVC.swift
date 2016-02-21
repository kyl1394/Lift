//
//  ProfileVC.swift
//  LIFT
//
//  Created by Jordan Kauffman on 2/21/16.
//  Copyright © 2016 Jordan Kauffman. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    var fbPic:String!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        print(fbPic)
        super.viewDidLoad()
        
        fbPic = fbPic.stringByReplacingOccurrencesOfString("http", withString: "https", options: NSStringCompareOptions.LiteralSearch, range: nil)
        load_image(fbPic)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func load_image(urlString:String)
    {
        
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url) {
                imageView.image = UIImage(data: data)
            }        
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

