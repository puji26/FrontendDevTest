//
//  NetworkService.swift
//  Employee
//
//  Created by Puji Wahono on 16/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//
import Foundation
import Moya
import SwiftyJSON

struct NetworkingService {
    static func getData(endPoint:MyService, completion: @escaping ((_ success: JSON?,_ error:String?,_ statusCode:Int? ) -> Void)) {
        
        // 😤 if you would view log moya process
     let provider = MoyaProvider<MyService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
       //  let provider = MoyaProvider<MyService>()
        provider.request(endPoint) { (result) in
            switch result {
            case let .success(moyaResponse):
                do {
                    let dataMap = try moyaResponse.mapJSON()
                    let statusCode =  moyaResponse.statusCode
                    let dataJSON = JSON(dataMap)
        
                    completion(dataJSON,nil,statusCode)
                }
                catch {
                    if let error = error as? MoyaError {
                        do {
                            let body = try error.response?.mapJSON()
                            let statusCode =  moyaResponse.statusCode
                            completion(nil,body.debugDescription,statusCode)
                        } catch {
                            let statusCode =  moyaResponse.statusCode
                            completion(nil,error.localizedDescription,statusCode)
                        }
                    }
                }
            case let .failure(error):
                completion(nil,error.localizedDescription,0)
            }
        }
    }
    
}


