//
//  StrikeThroughText.swift
//  bucketList
//
//  Created by Pamela on 9/26/16.
//  Copyright © 2016 Pam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var toDoItems = [ToDoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        //tableView.separatorStyle = .none
        //tableView.backgroundColor = UIColor.black
        tableView.rowHeight = 50;
        
        if toDoItems.count > 0 {
            return
        }
        toDoItems.append(ToDoItem(text: "Sing the Good Ole Song"))
        toDoItems.append(ToDoItem(text: "Attend Rotunda Sing"))
        toDoItems.append(ToDoItem(text: "High-five Dean Groves"))
        toDoItems.append(ToDoItem(text: "Get #1 Ticket at Bodo's"))
        toDoItems.append(ToDoItem(text: "Go to Foxfield"))
        toDoItems.append(ToDoItem(text: "Hike Humpback"))
        toDoItems.append(ToDoItem(text: "Pick Apples at Carter's Mountain"))
        toDoItems.append(ToDoItem(text: "Streak the Lawn"))
        toDoItems.append(ToDoItem(text: "Take a Tour of the Rotunda"))
        toDoItems.append(ToDoItem(text: "Get Duck Donuts"))
        toDoItems.append(ToDoItem(text: "Go to a Football Game"))
        toDoItems.append(ToDoItem(text: "Attend Trick-or-Treating on the Lawn"))
//        toDoItems.append(ToDoItem(text: "item 1"))
//        toDoItems.append(ToDoItem(text: "item 2"))
//        toDoItems.append(ToDoItem(text: "item 4"))
//        toDoItems.append(ToDoItem(text: "item 5"))
//        toDoItems.append(ToDoItem(text: "item 6"))

    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! TableViewCell
        //            cell.textLabel?.backgroundColor = UIColor.clearColor()
        
        cell.selectionStyle = .none
        let item = toDoItems[(indexPath as NSIndexPath).row]
        //            cell.textLabel?.text = item.text
        cell.delegate = self
        cell.toDoItem = item
        return cell
    }
    
    func toDoItemDeleted(_ toDoItem: ToDoItem) {
        // could use this to get index when Swift Array indexOfObject works
        // let index = toDoItems.indexOfObject(toDoItem)
        // in the meantime, scan the array to find index of item to delete
        var index = 0
        for i in 0..<toDoItems.count {
            if toDoItems[i] === toDoItem {  // note: === not ==
                index = i
                break
            }
        }
        // could removeAtIndex in the loop but keep it here for when indexOfObject works
        toDoItems.remove(at: index)
        
        // use the UITableView to animate the removal of this row
        tableView.beginUpdates()
        let indexPathForRow = IndexPath(row: index, section: 0)
        tableView.deleteRows(at: [indexPathForRow], with: .fade)
        tableView.endUpdates()
    }
    
    // MARK: - Table view delegate
    
    //    func colorForIndex(_ index: Int) -> UIColor {
    //        let itemCount = toDoItems.count - 1
    //        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
    //        return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
    //    }
    
    func tableView(_ tableView: UITableView!, willDisplay cell: UITableViewCell!,
                   forRowAt indexPath: IndexPath) {
        //cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    // support for versions of iOS prior to iOS 8
    func tableView(_ tableView: UITableView, heightForRowAt
        indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight;
    }
    
    @IBAction func prepare(forUnwind segue: UIStoryboardSegue) {
    }
    
    //MARK:- Prepare Segue
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editAction" {
            let cell = sender as! UITableViewCell
            let selectedRow = (tableView.indexPath(for: cell) as NSIndexPath?)?.item
            let detailViewController:DetailViewController = segue.destination as! DetailViewController
            
            detailViewController.index = selectedRow
            detailViewController.text = toDoItems[selectedRow!]
        }
    }
    */
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "editAction" {
            let itemDetailViewController = segue.destination as! DetailViewController
            if let selectedTableCell = sender as? ToDoItem {
                //let indexPath = tableView.indexPath(for: selectedTableCell)!
                //let selectedItem = toDoItems[(indexPath as NSIndexPath).row]
                itemDetailViewController.item = selectedTableCell
            }
            
        }
    }
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create a variable that you want to send based on the destination view controller
        // You can get a reference to the data by using indexPath shown below
        let selectedItem = toDoItems[indexPath.row]
        
        self.performSegue(withIdentifier: "editAction", sender: selectedItem)
        //self.prepare(for segue: UIStoryboardSegue, sender: <#T##Any?#>)
    }
    
    @IBAction func unwindToBucketList(sender: UIStoryboardSegue) {
        
        
        if let sourceViewController = sender.source as? AddItemViewController, let item = sourceViewController.item {
            let newIndexPath = IndexPath(row: toDoItems.count, section: 0)
            toDoItems.append(item)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
        }
        

    }
    
    @IBAction func unwindEditToBucketList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? DetailViewController, let item = sourceViewController.item {

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // Update an existing item.
            toDoItems[selectedIndexPath.row] = item
            if(item.completed){
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: selectedIndexPath)
                    as! TableViewCell
                cell.itemCompleteLayer.isHidden = false
            }
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        }
        }
        
        
    }


    
}

