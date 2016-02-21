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
    var ref:Firebase!
    var hold:String = ""
    var facebookProfileUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func loginFB(sender: AnyObject) {
        
        ref = Firebase(url: "https://liftappdb.firebaseio.com/")
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
                    self.ref.authWithOAuthProvider("facebook", token: accessToken,
                        withCompletionBlock: { error, authData in
                            if error != nil {
                                print("Login failed. \(error)")
                            }
                            else
                            {
                                print("Logged in! \(authData)")
                                self.authData = authData
                                
                                let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
                                graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                                    
                                    if ((error) != nil)
                                    {
                                        // Process error
                                        print("Error: \(error)")
                                    }
                                    else
                                    {
                                        if let id: NSString = result.valueForKey("name") as? NSString {
                                            self.ref = self.ref.childByAppendingPath("Users/").childByAppendingPath("\(id)")
                                            self.ref.childByAppendingPath("/name/")//.setValue(id)
                                            self.ref.childByAppendingPath("/birthYear/").setValue("1992")
                                            self.ref.childByAppendingPath("/name/").setValue(id)
                                            self.hold = id as String
                                            self.facebookProfileUrl = "http://graph.facebook.com/\(result.valueForKey("id")!)/picture?type=large"
                                            
                                            self.performSegueWithIdentifier("login", sender: sender)
                                        } else {
                                            print("ID es null")
                                        }
                                        
                                        
                                    }
                                })
                                
                                
                            }
                    })
                }
                
        })
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "login"
        {
            let tabBarController = segue.destinationViewController as! UITabBarController;
            let destinationViewController0 = tabBarController.viewControllers![0] as! LandingVC
            let destinationViewController = tabBarController.viewControllers![1] as! InterestsVC
            let destinationViewController2 = tabBarController.viewControllers![2] as! ProfileVC
            destinationViewController0.ref = self.ref
            destinationViewController.authData = self.authData
            destinationViewController.ref = self.ref
            destinationViewController2.fbPic = self.facebookProfileUrl
            
        
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

