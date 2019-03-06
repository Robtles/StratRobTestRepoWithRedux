//
//  ControllersSectionInit.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



public struct ControllersSectionInit: Input {
    
    // MARK: - Instance Properties
    
    public var data: [String : Any?]
    
    public var meta: ControllersSectionInit.Meta = ControllersSectionInit.Meta(.input)
    
    public var routes: [Route] {
        return data["routes"] as? [Route] ?? []
    }
    
    // MARK: - Init Methods
    
    public init() {
        self.data = [:]
    }
    
    public init(_ data: [String : Any?]) {
        self.init()
    }
    
    public init(withRoute route: Route) {
        self.data = ["routes": [route]]
    }
    
}
