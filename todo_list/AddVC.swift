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
    
    weak var delegate: AddVCDelegate?
    
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
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {

        let item = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: managedObjectContext ) as! Todo
        item.title = titleField.text
        item.details = detailsField.text
        item.due_date = dueDateField.date

        do {
            try managedObjectContext.save()
        } catch {
            print( error )
        }
        
        if let d = delegate {
            d.refreshTable()
        }
        
        dismiss( animated: true, completion: nil )
    }
    
    
    
}
