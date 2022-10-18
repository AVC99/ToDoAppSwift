//
//  CustomTableViewCell.swift
//  ReminderApp
//
//  Created by Arnau Vives on 17/10/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var dueDate: UILabel!
    
    @IBOutlet weak var assignedTo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
