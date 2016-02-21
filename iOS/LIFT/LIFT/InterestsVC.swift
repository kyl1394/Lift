//
//  InterestsVC.swift
//  LIFT
//
//  Created by Jordan Kauffman on 2/20/16.
//  Copyright © 2016 Jordan Kauffman. All rights reserved.
//

import UIKit
import Firebase
class InterestsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var authData : FAuthData!
    //var cell:UITableViewCell!
    var ref:Firebase!
    var hopeful:Array<Int> = []
    
    let interestArray:Array<String> =
        ["Biking",
        "Spin Class",
        "Zumba",
        "Yoga",
        "Pilates",
        "Hiking",
        "Climbing",
        "Karate",
        "Ju Jitsu",
        "Taekwondo",
        "Boxing",
        "Lifting Machines",
        "Free Weights",
        "Ellipticals",
        "Running",
        "Walking",
        "Basketball",
        "Football",
        "Baseball",
        "Softball",
        "Volleyball",
        "Soccer",
        "Skiing",
        "Snowboarding",
        "Skating",
        "Ultimate Frisbee",
        "Golf",
        "Disc Golf",
        "Leisure Sports",
        "Bowling"]
    @IBAction func save(sender: AnyObject) {
        var interests:Array<String> = []
        for var i = 0; i < interestArray.count; i++
        {
            if hopeful.contains(i)
            {
                interests.append(interestArray[i])
            }
        }
        ref.childByAppendingPath("Interests/").setValue(interests)
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(animated: Bool) {
        
//        ref.observeSingleEventOfType(.Value, withBlock: { snapshot in print(snapshot)
//            let arr = snapshot.valueForKey("Interests") as! NSArray
//            for var i = 0; i < self.interestArray.count; i++
//            {
//                if arr[i]
//            }
//        })
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = interestArray[indexPath.row]
        if(hopeful.contains(indexPath.row))
        {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryType.None;
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interestArray.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if (cell?.accessoryType == UITableViewCellAccessoryType.Checkmark){
            
            cell!.accessoryType = UITableViewCellAccessoryType.None;
            
        }else{
            
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark;
            
        }
        
        if(hopeful.contains(indexPath.row))
        {
            hopeful.removeAtIndex(hopeful.indexOf(indexPath.row)!)
        }
        else
        {
            hopeful.append(indexPath.row)
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
