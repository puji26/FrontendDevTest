//
//  Employee.swift
//  Employee
//
//  Created by Puji Wahono on 16/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation

struct Employee {
    var id : Int
    var employee_name : String
    var employee_salary : Int
    var employee_age : Int
    var profile_image : String
    
    
    init(dictionary:[String:Any]) {
        id = dictionary["id"] as? Int ?? 0
        employee_name = dictionary["employee_name"] as? String ?? ""
         employee_salary = dictionary["employee_salary"] as? Int ?? 0
         employee_age = dictionary["employee_age"] as? Int ?? 0
         profile_image = dictionary["profile_image"] as? String ?? ""
    }
    
}
