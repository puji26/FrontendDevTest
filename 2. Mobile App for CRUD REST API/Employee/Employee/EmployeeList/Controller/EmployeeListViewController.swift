//
//  EmployeeListViewController.swift
//  Employee
//
//  Created by Puji Wahono on 15/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class EmployeeListViewController: UIViewController {
    
    @IBOutlet weak var tableEmployee: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var arrEmployee = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getDataListEmployee()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    func setupUI(){
        tableEmployee.delegate = self
        tableEmployee.dataSource = self
        tableEmployee.tableFooterView = UIView.init(frame: .zero)
        tableEmployee.register(UINib(nibName: "EmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeListCell")
        
        self.title = "Employee List"
        
    }
    
    func getDataListEmployee(){
        activityIndicator.startAnimating()
        EmployeeManagerData.employeeManagerData { (employee, error, statusCode) in
            if error != nil {
                self.activityIndicator.stopAnimating()
            } else {
                guard let employee = employee else { return}
                self.arrEmployee = employee
                DispatchQueue.main.async {
                    self.tableEmployee.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}

extension EmployeeListViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrEmployee.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeListCell", for: indexPath) as! EmployeeListTableViewCell
        let employee = arrEmployee[indexPath.row]
        cell.setup(item: employee)
        
        return cell
    }
}
