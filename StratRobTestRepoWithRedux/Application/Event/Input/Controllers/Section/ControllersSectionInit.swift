//
//  ControllersSectionInit.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



struct ControllersSectionInit: Input {
    
    // MARK: - Instance Properties
    
    var data: [String : Any?]
    
    var meta: ControllersSectionInit.Meta = ControllersSectionInit.Meta(.input)
    
    var routes: [Route] {
        return data["routes"] as? [Route] ?? []
    }
    
    // MARK: - Init Methods
    
    init() {
        self.data = [:]
    }
    
    init(_ data: [String : Any?]) {
        self.init()
    }
    
    init(withRoute route: Route) {
        self.data = ["routes": [route]]
    }
    
}
