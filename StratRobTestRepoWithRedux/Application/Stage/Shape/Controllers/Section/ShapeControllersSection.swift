//
//  ShapeControllersSection.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 05/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift; import UIKit;



public class ShapeControllersSection: UINavigationController, UINavigationControllerDelegate, StoreSubscriber {
    
    // MARK: - Instance Properties
    
    public var identifier: String {
        return ""
    }
    
    public var sectionType: String {
        return "current"
    }
    
    public var shouldShowNavigationBar: Bool {
        return true
    }

    // MARK: - Init Methods
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not intended to be used")
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.commonInit()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.commonInit()
    }

    private func commonInit() {
        store.dispatch(ControllersSectionInit())
    }
    
    // MARK: Life Methods
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.isHidden = !self.shouldShowNavigationBar
        store.subscribe(self)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    // MARK: Section Methods
    
    @objc public func pop() {
        if Thread.isMainThread {
            self.popViewController(animated: true)
            
        } else {
            DispatchQueue.main.async {
                self.popViewController(animated: true)
            }
        }
    }
    
    public func push(_ feature: ShapeControllersFeature) {
        if Thread.isMainThread {
            self.pushViewController(feature, animated: true)
        } else {
            DispatchQueue.main.async {
                self.pushViewController(feature, animated: true)
            }
        }
    }
    
    // MARK: Store Methods
    
    public func newState(state: Store) {}
    
}
