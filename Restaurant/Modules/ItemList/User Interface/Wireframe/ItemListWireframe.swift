//
//  ItemListWireframe.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

import UIKit

class ItemListWireframe {
     weak var view: UIViewController!
}

extension ItemListWireframe: ItemListWireframeInput {
    
    var storyboardName: String {return "ItemList"}
    
    func getMainView() -> UIViewController {
        let service = ItemListService()
        let interactor = ItemListInteractor(service: service)
        let presenter = ItemListPresenter()
        let viewController = viewControllerFromStoryboard(of: ItemListViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
