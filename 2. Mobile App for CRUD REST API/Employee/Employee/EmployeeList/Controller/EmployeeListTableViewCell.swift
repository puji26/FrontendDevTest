//
//  EmployeeListTableViewCell.swift
//  Employee
//
//  Created by Puji Wahono on 15/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class EmployeeListTableViewCell: UITableViewCell {
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(item:Employee){
        lblID.text = "\(item.id)"
        lblNama.text = item.employee_name
        lblSalary.text = "\(item.employee_salary)"
        lblAge.text = "\(item.employee_age)"
    }
    
}
