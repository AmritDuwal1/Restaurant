//
//  ItemListViewController.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    
    // MARK: Properties
    var presenter: ItemListModuleInterface?
    var currentIndex: Int = 0
    let itemList: [Item] = [
        Item(rating: 4.2, FoodName: "Burger", price: 320, reviewCount: 900, imageName: "burger", distance: 2.2, address: "Bhaktapur, Suryabinayak", discount: 10),
        Item(rating: 4.2, FoodName: "Chicken Biryani", price: 320, reviewCount: 800, imageName: "chickenBiryani", distance: 2.2, address: "Bhaktapur, Nagpokhari", discount: 14.60),
        Item(rating: 4.2, FoodName: "French Fry", price: 320, reviewCount: 400, imageName: "frenchFry", distance: 4, address: "Kathmandu, Tinkune", discount: 13),
        Item(rating: 4.2, FoodName: "Pizza", price: 320, reviewCount: 950, imageName: "Pizza", distance: 10.5, address: "Lalitpur, Balkumari", discount: 20.50)
    ]
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var DetailViewBackGround: UIView!
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var quantitySubLabel: UILabel!
    @IBOutlet weak var discountPercentLabel: UILabel!
    @IBOutlet weak var quantityAmountLabel: UILabel!
    @IBOutlet weak var discountedAmountLabel: UILabel!
    @IBOutlet weak var taxAmountLabel: UILabel!
    @IBOutlet weak var netAmountLabel: UILabel!
    
    // MARK: VC's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DetailViewBackGround.isHidden = true
    }
    
    // MARK: IBActions
    @IBAction func closeButtonPressed(_ sender: Any) {
        DetailViewBackGround.isHidden = true
    }
    
    @IBAction func increaseQuantityButtonPressed(_ sender: Any) {
        let quantity = Int(quantityLabel.text!) ?? 0
        quantityLabel.text = String(quantity + 1)
        updateGivenValue(quantity: Double(quantity + 1), orderNow: false)
        
    }
    
    @IBAction func decreaseQuantityButtonPressed(_ sender: Any) {
        let quantity = Int(quantityLabel.text!) ?? 0
        if quantity == 1 {
            return
        }else {
            quantityLabel.text = String(quantity - 1)
            updateGivenValue(quantity: Double(quantity - 1), orderNow: false)
        }
    }
    
    @IBAction func orderNowButtonPressed(_ sender: Any) {
        updateGivenValue(quantity: Double(quantityLabel.text!) ?? 1, orderNow: true)
    }
    
    
    // MARK: Other Functions
    func updateGivenValue(quantity: Double, orderNow: Bool) {
        let temp = itemList[currentIndex]
        let taxAmount = ((temp.price * quantity) *  (8.25 / 100)).rounded()
        let discountedAmount = (temp.price * quantity) * (temp.discount / 100)
        let netAmount = Int((temp.price * quantity - taxAmount + discountedAmount).rounded())
        foodImageView.image = UIImage(named: temp.imageName)
        foodNameLabel.text = temp.FoodName
        discountPercentLabel.text = "\(temp.discount)%"
        discountedAmountLabel.text = "\(Int(discountedAmount.rounded()))"
        taxAmountLabel.text = "\(Int(taxAmount))"
        netAmountLabel.text = String(netAmount)
        quantityAmountLabel.text = "\(Int(temp.price * quantity))"
        quantitySubLabel.text = "\(Int(quantity))"
        quantityLabel.text = "\(Int(quantity))"
        let subTotal = Int(discountedAmount + (temp.price * quantity))
        if orderNow {
            presenter?.orderTheFood(subTotal: subTotal, discountTotal: Int(discountedAmount), taxTotal: Int(taxAmount), netTotal: netAmount, quantity: Int(quantity), netPrice: Int(temp.price - temp.price * (0.01 * 8.25)), discount: Int(temp.price * (temp.discount * 0.01)))
        }
    }
    
}

// MARK: ItemListViewInterface
extension ItemListViewController: ItemListViewInterface {
    func show(success: String) {
        alert(message: nil, title: success, okAction: {
            self.DetailViewBackGround.isHidden = true
        })
    }
    
    func showLoading() {
        self.showProgressHud()
    }
    
    func hideLoading() {
        self.hideProgressHud()
        
    }
    
    func show(error: Error) {
        alert(message: error.localizedDescription, okAction: {})
        
    }
}
extension ItemListViewController: UITableViewDelegate {
    
}
extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemListTableViewCell", for: indexPath) as! ItemListTableViewCell
        cell.setData(item: itemList[indexPath.row])
        cell.cellDelegate = self
        cell.indexPath = indexPath
        return cell
    }
    
}


extension ItemListViewController: PlaceOrder {
    func placeOrder(index: Int) {
        self.currentIndex = index
        DetailViewBackGround.isHidden = false
        updateGivenValue(quantity: 1, orderNow: false)
        
    }
}
