//
//  ToDoVC.swift
//  todo_list
//
//  Created by Ruslan Suvorov on 3/16/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit
import CoreData

protocol TodoCellDelegate: class {
}

protocol AddVCDelegate: class {
    func refreshTable()
}

class ToDoVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var managedObjectContext = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    
    var result = [Todo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        tableView.dataSource = self
        tableView.delegate = self //>> check with Eli
        tableView.rowHeight = 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let d = segue.destination as? AddVC
        d?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Todo")
        do {
            result = try managedObjectContext.fetch( request ) as! [Todo]
        } catch {
            print( error )
        }
    }
}

extension ToDoVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath) as! TodoCell
        
        cell.titleLabel.text = result[indexPath.row].title
        cell.detailsLabel.text = result[indexPath.row].details

        if let d = result[indexPath.row].due_date {
            cell.due_dateLabel.text = "\(d)"
        }
        
        cell.accessoryType = .none
        if result[indexPath.row].status == true {
            cell.accessoryType = .checkmark
        }

        cell.delegate = self
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = result[indexPath.row]
        managedObjectContext.delete(item)

        do {
            try managedObjectContext.save()
        } catch {
            print( error )
        }
        result.remove( at: indexPath.row )
        tableView.reloadData()
    }
}

extension ToDoVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow( at: indexPath, animated: true )

        if result[indexPath.row].status == false {
            result[indexPath.row].status = true
            if let cell = tableView.cellForRow( at: indexPath ) {
                cell.accessoryType = .checkmark
            }
        } else {
            result[indexPath.row].status = false
            if let cell = tableView.cellForRow( at: indexPath ) {
                cell.accessoryType = .none
            }
        }

        do {
            try managedObjectContext.save()
        } catch {
            print( error )
        }
    }
}

extension ToDoVC: TodoCellDelegate {
}

extension ToDoVC: AddVCDelegate {
    func refreshTable() {
        print( "refreshtable" )
        fetchAllItems()
        tableView.reloadData()
    }
}
