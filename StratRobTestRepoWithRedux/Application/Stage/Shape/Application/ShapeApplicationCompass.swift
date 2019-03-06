//
//  ShapeApplicationCompass.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift; import UIKit


// MARK: Typealias

public typealias Compass = ShapeApplicationCompass

// MARK: - Type

public class ShapeApplicationCompass: UITabBarController, UITabBarControllerDelegate, StoreSubscriber {

    // MARK: - Static Properties
    
    public static let shared = Compass()
    
    /// Should extend this
    public var tabBarViewControllers: [ShapeControllersFeature] {
        return []
    }
    
    // MARK: - Init Methods
    
    deinit {
        store.unsubscribe(self)
    }
    
    private init() {
        super.init(nibName: nil, bundle: nil)
        store.subscribe(self)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not intended to be used")
    }

    // MARK: Life Methods
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers(tabBarViewControllers, animated: true)
        self.tabBar.isHidden = true
    }
    
    // MARK: Navigation Methods
    
    public func push(_ route: Route, in section: String = "current") {
        guard let currentSection = self.selectedViewController as? ShapeControllersSection else {
            return
        }
        if currentSection.sectionType != "current" {
            (self.viewControllers as? [ShapeControllersSection])?.enumerated().forEach({ index, tabBarSection in
                if section == tabBarSection.sectionType {
                    self.selectedIndex = index
                }
            })
        }
        store.dispatch(ControllersSectionPush(route))
    }
    
    // MARK: Store Methods
    
    public func newState(state: Store) {}

}
