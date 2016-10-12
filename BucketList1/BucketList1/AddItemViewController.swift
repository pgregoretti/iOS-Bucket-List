//
//  AddItemViewController.swift
//  BucketList1
//
//  Created by Pamelons on 10/7/16.
//  Copyright © 2016 Amy Zhao. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    @IBOutlet weak var saveItemButton: UIBarButtonItem!
    @IBOutlet weak var addItemTextField: UITextField!
    var item: ToDoItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        
        if saveItemButton.isEqual(sender) {
            let goal = addItemTextField.text ?? ""
            item = ToDoItem(text: goal)
        }
        

    }
    
    

}
