//
//  ControllersSectionPush.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



public struct ControllersSectionPush: Input {
    
    // MARK: - Instance Properties
    
    public var data: [String : Any?]
    
    public var route: Route {
        get {
            return self.data["route"] as? Route ?? Route()
        }
        set {
            self.data["route"] = newValue
        }
    }
    
    public var meta: ControllersSectionPush.Meta = ControllersSectionPush.Meta(.input)
    
    // MARK: - Init Methods
    
    public init() {
        self.data = [:]
    }
    
    public init(_ data: [String : Any?]) {
        self.data = data
    }
    
    public init(_ route: Route) {
        self.data = ["route": route]
    }
    
}
