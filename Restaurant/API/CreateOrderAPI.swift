//
//  RestaurantAPI.swift
//  Job
//
//  Created by ekbana on 12/26/19.
//  Copyright © 2019 ekbana. All rights reserved.
//

import Foundation
struct itemList {
    let quantity: Int
    let tax: Int
    let netPrice: Int
    
    var dictionaryRepresentation: [String: Any] {
        return [
            "quantity" : quantity,
            "tax" : tax,
            "netPrice" : netPrice
        ]
    }
}

protocol CreateOrderAPI {
    func createOrder(subTotal: Int, discountTotal: Int, taxTotal: Int, netTotal: Int, quantity: Int, netPrice: Int, discount: Int, success: @escaping (Success) -> (), failure: @escaping (Error) -> () )
}

extension CreateOrderAPI {
    func createOrder(subTotal: Int, discountTotal: Int, taxTotal: Int, netTotal: Int, quantity: Int, netPrice: Int, discount: Int, success: @escaping (Success) -> (), failure: @escaping (Error) -> () ) {
        guard let url = URL(string: "http://3.18.25.237/api/Orders/CreateNewOrder") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let itemListStruct = itemList(quantity: quantity, tax: 0, netPrice: 0)
        let userItemListStruct = itemListStruct.dictionaryRepresentation
        //        let parameters = ["sessionGuid": "777241bd-3790-4270-a4a4-029756eaa7d3",
        //                          "subTotal": "\(Double(subTotal))",
        //            "discountTotal": "\(Double(discountTotal))",
        //            "taxTotal": "\(Double(taxTotal))",
        //            "netTotal": "\(Double(netTotal))",
        //            "itemsList":[userItemListStruct]] as [String : Any]
        
        // MARK: there is an api issue all data must be zero to get success message .
        let parameters = ["sessionGuid": "777241bd-3790-4270-a4a4-029756eaa7d3", "subTotal": 0, "discountTotal": 0, "taxTotal": 0.0, "netTotal": 0, "itemsList": [userItemListStruct]] as [String : Any]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request){ (data, response, error) in
            if let data = data {
                do {
                    let mainData = try JSONDecoder().decode(Success.self, from: data)
                    success(mainData)
                } catch {
                    failure(error)
                }
            }
        }.resume()
        
    }
}
