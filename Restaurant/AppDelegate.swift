//
//  AppDelegate.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//  Copyright © 2020 Amrit Duwal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

       var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = ItemListWireframe().getMainView()
        return true
    }



}

