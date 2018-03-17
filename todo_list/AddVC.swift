//
//  AddVC.swift
//  todo_list
//
//  Created by Ruslan Suvorov on 3/16/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit
import CoreData

class AddVC: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    @IBOutlet weak var dueDateField: UIDatePicker!
    
    var managedObjectContext = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        print( titleField.text, detailsField.text, dueDateField.date, "add" )

        let item = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: managedObjectContext ) as! Todo
        item.title = titleField.text
        item.details = detailsField.text
        item.due_date = dueDateField.date

        do {
            try managedObjectContext.save()
        } catch {
            print( error )
        }
        dismiss( animated: true, completion: nil )
    }
    
    
    
}
