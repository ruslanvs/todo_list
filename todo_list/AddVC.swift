//
//  AddVC.swift
//  todo_list
//
//  Created by Ruslan Suvorov on 3/16/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    @IBOutlet weak var dueDateField: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: "dismissKeyboard" )
//        view.addGestureRecognizer( tap )
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

    @IBAction func addButtonPressed(_ sender: UIButton) {
        print( titleField.text, detailsField.text, dueDateField.date, "add" )
    }
    
    
}
