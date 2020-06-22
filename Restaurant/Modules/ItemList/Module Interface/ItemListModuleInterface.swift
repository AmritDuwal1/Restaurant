//
//  ItemListModuleInterface.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

protocol ItemListModuleInterface: class {
    func orderTheFood(subTotal: Int, discountTotal: Int, taxTotal: Int, netTotal: Int, quantity: Int, netPrice: Int, discount: Int)
}
