//
//  ViewController.swift
//  LIFT
//
//  Created by Jordan Kauffman on 2/20/16.
//  Copyright © 2016 Jordan Kauffman. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKShareKit
class LoginVC: UIViewController {
 var authData : FAuthData!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func loginFB(sender: AnyObject) {
        
        let ref = Firebase(url: "https://liftappdb.firebaseio.com")
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"],
            fromViewController:self,
            handler: {
                (facebookResult, facebookError) -> Void in
                if facebookError != nil {
                    print("Facebook login failed. Error \(facebookError)")
                } else if facebookResult.isCancelled {
                    print("Facebook login was cancelled.")
                } else {
                    let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                    ref.authWithOAuthProvider("facebook", token: accessToken,
                        withCompletionBlock: { error, authData in
                            if error != nil {
                                print("Login failed. \(error)")
                            }
                            else
                            {
                                print("Logged in! \(authData)")
                                self.authData = authData
                                //self.performSegueWithIdentifier("profile", sender: sender)
                            }})
                }
                
        })
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "profile"
        {
            
//                        let profileVC = segue.destinationViewController as! ProfileVC
//                        profileVC.authData = self.authData
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

