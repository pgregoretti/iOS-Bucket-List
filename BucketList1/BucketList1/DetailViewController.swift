//
//  DetailViewController.swift
//  BucketList1
//
//  Created by Amy Zhao on 10/7/16.
//  Copyright © 2016 Amy Zhao. All rights reserved.
//

/*
import UIKit

class DetailViewController: UIViewController {

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

}
*/

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var completedSlider: UISwitch!
    @IBOutlet weak var editTextField: UITextField!
    var item: ToDoItem?
    var index:Int?
    
    //@IBOutlet var textField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       if let name =text?.text {
//            editTextField?.text = name
//        }
        
        //editTextField.delegate = self
        
        if let item = item {
            completedSlider.isOn = item.completed
            editTextField.text   = item.text
        }
        
        
    }
    
    // MARK:- PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if saveButton.isEqual(sender) {
        let completed = completedSlider.isOn
        let goal = editTextField.text ?? ""
            item = ToDoItem(text: goal, completed: completed)
    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
