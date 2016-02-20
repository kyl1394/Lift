//
//  LoginVC.swift
//  Lift
//
//  Created by Jordan Kauffman on 2/19/16.
//  Copyright © 2016 Jordan Kauffman. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit

class LoginVC: UIViewController {

    var authData : FAuthData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(sender: AnyObject) {
        
        let ref = Firebase(url:"https://liftappdb.firebaseio.com/")
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"],
            fromViewController:self,
            handler: {
                (facebookResult, facebookError) -> Void in
        if facebookError != nil
            {
                print("Facebook login failed. Error \(facebookError)")
            }
        else if facebookResult.isCancelled
        {
                    print("Facebook login was cancelled.")
        }
        else
        {
            let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
            ref.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
            if error != nil
            {
                print("Login failed. \(error)")
            }
            else
            {
                print("Logged in! \(authData)")
                self.authData = authData
                self.performSegueWithIdentifier("profile", sender: sender)
            }})
        }
                
        })
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "profile"
        {
            
            let profileVC = segue.destinationViewController as! ProfileVC
            profileVC.authData = self.authData
            
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
