//
//  ShapeApplicationMainBase.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 07/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import UIKit



open class ShapeApplicationMainBase: UIResponder, UIApplicationDelegate {
    
    // MARK: View Properties
    
    static public var rootViewController = UIApplication.shared.delegate?.window??.rootViewController
    
    open var window: UIWindow?
    
    // MARK: Life Methods
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        defer {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            Compass.shared.updateContent()
            self.defaultLaunch()
        }
        return true
    }
    
    // MARK: View Methods
    
    open func defaultLaunch() {
        self.replace(with: Compass.shared)
    }
    
    open func replace(with viewController: UIViewController) {
        defer {
            window?.makeKeyAndVisible()
        }
        if Thread.isMainThread {
            window?.rootViewController = viewController
        } else {
            DispatchQueue.main.async {
                self.window?.rootViewController = viewController
            }
        }
    }
    
    static public var topMostViewController: UIViewController? {
        guard let windowRootViewController = UIApplication.shared.delegate?.window??.rootViewController else {
            return nil
        }
        return ShapeApplicationMainBase.topMostViewController(windowRootViewController)
    }
    
    // Will find recursively the top-most presented view controller to avoid "already presenting view controller" issue
    private static func topMostViewController(_ parentViewController: UIViewController) -> UIViewController {
        return parentViewController.presentedViewController == nil ? parentViewController : ShapeApplicationMainBase.topMostViewController(parentViewController.presentedViewController!)
    }
    
}
