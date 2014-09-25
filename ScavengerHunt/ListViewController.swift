//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Cambi Guo on 9/24/14.
//  Copyright (c) 2014 Guo Tao. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let itemsManager = ItemsManager()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsManager.items.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell") as UITableViewCell
        
            let item = itemsManager.items[indexPath.row]
            cell.textLabel!.text = item.name
//        
//            if let theLabel = cell.textLabel {
//                theLabel.text = itemsList[indexPath.row]
//            }
//
//            cell.textLabel?.text = itemsList[indexPath.row]
        
            if (item.isComplete) {
                cell.accessoryType = .Checkmark
                cell.imageView!.image = item.photo
            } else {
                cell.accessoryType = .None
                cell.imageView?.image = nil
            }
        
            return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true , completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let indexPath = tableView.indexPathForSelectedRow()!
        
        let selectedItem = itemsManager.items[indexPath.row]
        
        let photo = info[UIImagePickerControllerOriginalImage] as UIImage
        selectedItem.photo = photo
        
        dismissViewControllerAnimated(true, completion: {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation:.Automatic)
        })
    }
    
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if (segue.identifier == "DoneItem") {
            
            let addItemController = segue.sourceViewController as ViewController
            if let newItem = addItemController.createdItem {
                itemsManager.items += [newItem]
                itemsManager.save()
                let indexPath =  NSIndexPath(forRow: itemsManager.items.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
        
    }
    
}

