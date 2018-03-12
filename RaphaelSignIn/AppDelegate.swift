//
//  AppDelegate.swift
//  RaphaelSignIn
//
//  Created by Suzie Su Jin Ahn on 2/17/18.
//  Copyright © 2018 Raphael Wellness Center. All rights reserved.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
        -> Bool {
            FirebaseApp.configure()
            return true
    }
}

