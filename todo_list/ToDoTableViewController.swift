//
//  ToDoTableViewController.swift
//  todo_list
//
//  Created by Ruslan Suvorov on 3/16/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit
import CoreData

protocol TodoCellDelegate: class {
    
}

class ToDoTableViewController: UITableViewController {
    
    var managedObjectContext = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    
    var result = [Todo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        
        tableView.rowHeight = 120
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath) as! TodoCell
        
        cell.titleLabel.text = result[indexPath.row].title
        cell.detailsLabel.text = result[indexPath.row].details
        if let d = result[indexPath.row].due_date {
            cell.due_dateLabel.text = "\(d)"
        }
        
        cell.delegate = self
        
        return cell
    }

    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Todo")
        do {
            result = try managedObjectContext.fetch( request ) as! [Todo]
//            for item in result {
//                print ( item.title )
//            }
//            print( result )
        } catch {
            print( error )
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ToDoTableViewController: TodoCellDelegate {
    
}
