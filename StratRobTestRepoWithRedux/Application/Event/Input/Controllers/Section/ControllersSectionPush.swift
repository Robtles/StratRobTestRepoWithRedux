//
//  ControllersSectionPush.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



struct ControllersSectionPush: Input {
    
    // MARK: - Instance Properties
    
    var data: [String : Any?]
    
    var route: Route {
        get {
            return self.data["route"] as? Route ?? Route()
        }
        set {
            self.data["route"] = newValue
        }
    }
    
    var meta: ControllersSectionPush.Meta = ControllersSectionPush.Meta(.input)
    
    // MARK: - Init Methods
    
    init() {
        self.data = [:]
    }
    
    init(_ data: [String : Any?]) {
        self.data = data
    }
    
    init(_ route: Route) {
        self.data = ["route": route]
    }
    
}
