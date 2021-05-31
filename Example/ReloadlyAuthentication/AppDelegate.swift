//
//  AppDelegate.swift
//  ReloadlyAuthentication
//
//  Created by 4taras4 on 03/15/2021.
//  Copyright (c) 2021 4taras4. All rights reserved.
//

import UIKit
import ReloadlySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ReloadlyAuthentication.shared.configure()
        return true
    }
}

