//
//  LandingVC.swift
//  LIFT
//
//  Created by Jordan Kauffman on 2/21/16.
//  Copyright © 2016 Jordan Kauffman. All rights reserved.
//

import UIKit
import Firebase
class LandingVC: UIViewController {
    var ref : Firebase!
    override func viewDidLoad() {
        super.viewDidLoad()
}
    @IBAction func logOut(sender: AnyObject) {
        ref = Firebase(url: "https://liftappdb.firebaseio.com/")
        ref.unauth()
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
