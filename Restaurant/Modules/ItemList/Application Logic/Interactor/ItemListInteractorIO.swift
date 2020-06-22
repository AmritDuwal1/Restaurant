//
//  ItemListInteractorIO.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

protocol ItemListInteractorInput: class {
    func doOrderTheFood(subTotal: Int, discountTotal: Int, taxTotal: Int, netTotal: Int, quantity: Int, netPrice: Int, discount: Int)
}

protocol ItemListInteractorOutput: class {
    func obtained(successMessage: String)
    func obtained(error: Error)
}
