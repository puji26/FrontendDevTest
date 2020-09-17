//
//  AddEmployeeViewController.swift
//  Employee
//
//  Created by Puji Wahono on 15/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSalary: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btnShowAllEmployee(_ sender: Any) {
        let listEmployee = EmployeeListViewController()
        self.navigationController?.pushViewController(listEmployee, animated: true)
    }
    
    
}
