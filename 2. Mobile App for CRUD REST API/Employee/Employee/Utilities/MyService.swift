//
//  MyService.swift
//  Employee
//
//  Created by Puji Wahono on 16/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

enum MyService {
    case AllEmployee
    case EmployeeById(IdEmployee:String)
    case CreateEmployee(nama:String,salary:String,age:String,profileImage:String)
    case UpdateEmployee(IdEmployee:String,nama:String,salary:String,age:String,profileImage:String)
    case DeleteEmployee(IdEmployee:String)
}

extension MyService : TargetType {
    
    static let LIVE = "https://dummy.restapiexample.com/api/"
    
    var baseURL: URL {
        switch self {
        default:
            return URL(string: MyService.LIVE)!
        }
    }
    
    var path: String {
        switch self {
        case .AllEmployee:
            return "v1/employees"
        case .EmployeeById(let IdEmployee):
            return "v1/employee/\(IdEmployee)"
        case .CreateEmployee:
            return "v1/create"
        case .UpdateEmployee(let IdEmployee,_,_,_,_):
            return "v1/update/\(IdEmployee)"
        case .DeleteEmployee(let IdEmployee):
            return "v1/delete/\(IdEmployee)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .AllEmployee, .EmployeeById:
            return .get
        case .CreateEmployee:
            return .post
        case .UpdateEmployee:
            return .put
        case .DeleteEmployee:
            return .delete
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return "".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case .AllEmployee:
            return .requestPlain
        case .EmployeeById:
           return .requestPlain
        case .CreateEmployee(let nama, let salary, let age, let profileImage):
            return .requestParameters(parameters: ["nama":nama ,"salary":salary , "age":age , "profileImage":profileImage ], encoding: URLEncoding.httpBody)
        case .UpdateEmployee(_, let nama, let salary, let age, let profileImage):
            return .requestParameters(parameters: ["nama":nama ,"salary":salary,"age":age ,"profileImage":profileImage], encoding: URLEncoding.httpBody)
        case .DeleteEmployee:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}


