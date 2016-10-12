//
//  ToDoItem.swift
//  bucketList
//
//  Created by Pamelons on 9/26/16.
//  Copyright © 2016 Pam. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    // A text description of this item.
    var text: String
    
    // A Boolean value that determines the completed state of this item.
    var completed: Bool
    
    // Returns a ToDoItem initialized with the given text and default completed value.
    init(text: String) {
        self.text = text
        self.completed = false
    }
    
    init(text: String, completed: Bool) {
        self.text = text
        self.completed = completed
    }

}
