//
//  EmployeeManagerData.swift
//  Employee
//
//  Created by Puji Wahono on 16/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import SwiftyJSON

class EmployeeManagerData  {
    typealias employeeHandler = (_ employee:[Employee]?,_ error:String?,_ statusCode:Int?) -> Void
    typealias successHandler = (_ success:String?,_ error:String?,_ statusCode:Int?) -> Void
    
   static func employeeManagerData( completion : @escaping (employeeHandler)) {
        NetworkingService.getData(endPoint: .AllEmployee) { (data, error , statusCode) in
            var employeeData = [Employee]()
            if error != nil {
                completion(nil, error, statusCode)
            } else {
                guard let data = data else {return}
                let resJSON = JSON(data)
                let dataOfEmployee = resJSON["data"].arrayObject  as? [[String:Any]]
                for field in dataOfEmployee ?? [[:]] {
                    let employeeDatas = Employee(dictionary: field)
                    employeeData.append(employeeDatas)
                }
                completion(employeeData, nil, statusCode)
            }
        }
        
    }
    
    static func addEmployeeManagerData( completion : @escaping (employeeHandler)) {
           NetworkingService.getData(endPoint: .AllEmployee) { (data, error , statusCode) in
               var employeeData = [Employee]()
               if error != nil {
                   completion(nil, error, statusCode)
               } else {
                   guard let data = data else {return}
                   let resJSON = JSON(data)
                   let dataOfEmployee = resJSON["date"].arrayObject  as? [[String:Any]]
                   for field in dataOfEmployee ?? [[:]] {
                       let employeeDatas = Employee(dictionary: field)
                       employeeData.append(employeeDatas)
                   }
                   completion(employeeData, nil, statusCode)
               }
           }
           
       }
       
    
}


