//
//  HideKeyboardExtension.swift
//  todo_list
//
//  Created by Ruslan Suvorov on 3/16/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector( UIViewController.dismissKeyboard ) )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer( tap )
    }
    
    @objc func dismissKeyboard() {
        view.endEditing( true )
    }
}
