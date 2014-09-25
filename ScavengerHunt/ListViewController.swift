//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Cambi Guo on 9/24/14.
//  Copyright (c) 2014 Guo Tao. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController {
    
    var itemsList = ["Cat", "Bird", "Brick"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell") as UITableViewCell
            cell.textLabel!.text = itemsList[indexPath.row]
//        
//            if let theLabel = cell.textLabel {
//                theLabel.text = itemsList[indexPath.row]
//            }
//
//            cell.textLabel?.text = itemsList[indexPath.row]
        
            return cell
    }
    
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        
        
    }
    
}

