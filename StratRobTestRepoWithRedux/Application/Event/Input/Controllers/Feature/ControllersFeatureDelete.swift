//
//  ControllersFeatureDelete.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



public struct ControllersFeatureDelete: Input {
    
    // MARK: - Instance Properties
    
    public var data: [String : Any?]
    
    public var meta: ControllersFeatureDelete.Meta
    
    // MARK: - Init Methods
    
    public init() {
        self.data = [:]
        self.meta = ControllersFeatureDelete.Meta(.input)
    }
    
    public init(_ data: [String : Any?]) {
        self.init()
    }
    
}
