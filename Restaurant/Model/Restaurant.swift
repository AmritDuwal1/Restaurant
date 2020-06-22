//
//  Restaurant.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//  Copyright © 2020 Amrit Duwal. All rights reserved.
//

import Foundation

// MARK: - Restaurant
struct Restaurant {
    let sessionGUID: String
    let subTotal, discountTotal, taxTotal, netTotal: Int
    let pickUp, delivery: Bool
    let itemsList: [ItemsList]

//    enum CodingKeys: String, CodingKey {
//        case sessionGUID = "sessionGuid"
//        case subTotal, discountTotal, taxTotal, netTotal, pickUp, delivery, itemsList
//    }
}

// MARK: - ItemsList
struct ItemsList {
    let itemID, quantity, netPrice, tax: Int
    let discount: Int
}
