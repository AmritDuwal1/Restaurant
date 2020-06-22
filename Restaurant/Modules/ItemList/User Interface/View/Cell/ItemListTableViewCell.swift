//
//  ItemListTableViewCell.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//  Copyright © 2020 Amrit Duwal. All rights reserved.
//

import UIKit
import Cosmos

protocol PlaceOrder {
    func placeOrder(index: Int)
}


class ItemListTableViewCell: UITableViewCell {
    var cellDelegate: PlaceOrder?
    var indexPath: IndexPath?
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var distanceAndAddressLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOpacity = 1
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 10
        backView.layer.cornerRadius = 10
        backView.layer.shadowOpacity = 0.2
    }
    
    func setData(item: Item){
        foodImageView.image = UIImage(named: item.imageName)
        foodNameLabel.text = item.FoodName
        ratingView.rating = Double(item.rating)
        distanceAndAddressLabel.text = "\(item.distance) Km - \(item.address)"
        price.text = "Rs. \(item.price)"
        reviewCountLabel.text = ("\(item.reviewCount) Reviews")
        discountLabel.text = "\(item.discount) % OFF"
        
    }
    
    @IBAction func placeOrderButtonPressed(_ sender: Any) {
        cellDelegate?.placeOrder(index: indexPath!.row)
    }
    
}
