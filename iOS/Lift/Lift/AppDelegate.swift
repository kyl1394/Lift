//
//  AppDelegate.swift
//  LIFT
//
//  Created by Jordan Kauffman on 2/20/16.
//  Copyright © 2016 Jordan Kauffman. All rights reserved.
//

    extension UIColor {
        convenience init(rgb: UInt) {
            self.init(
                red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgb & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
    }

import UIKit
import FBSDKCoreKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?
    
    func application(application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
            UITabBar.appearance().barTintColor = UIColor(rgb: 0x3A697E)
            UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(rgb: 0x0EB8050)], forState: .Selected)
            UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(rgb: 0xFFFFFF)], forState: .Normal)
            UITabBar.appearance().tintColor = UIColor(rgb: 0x0EB8050)
            
    
    //.setTitleTextAttributes({NSForegroundColorAttributeName:UIColor(rgb: 0x0EB8050}, forState:.Selected)

            //EB8050
            return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions:launchOptions)
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
            return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url,
                    sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }



}

