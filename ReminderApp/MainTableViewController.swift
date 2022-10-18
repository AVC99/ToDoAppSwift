//
//  MainTableViewController.swift
//  ReminderApp
//
//  Created by Arnau Vives on 17/10/22.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var data : [Task] = [Task(taskName: "TodoList", taskStatus: false, assignedTo: "James", date: Date())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        let newTask : Task = data [indexPath.row]
        cell.taskName.text = newTask.getTaskName()
        cell.assignedTo.text = newTask.getAssignedTo()
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy HH:mm")
        cell.dueDate.text = dateFormatter.string(from : newTask.getDate())
        
        if(newTask.getTaskStatus()==true){
            cell.status.text = "Finished"
            cell.accessoryType = .checkmark
        }else {
            cell.status.text = "Not Finished"
            cell.accessoryType = .none
            
        }
        
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            data.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
          }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.row].switchStatus()
        self.tableView.reloadData()
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "newTaskSegue") {
            let vc = segue.destination as! InputViewController
            vc.taskCallback = { newTask in
                
                self.data.append( newTask )
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    
}
