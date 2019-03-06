//
//  ControllersFeatureUpdate.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



public struct ControllersFeatureUpdate: Input {
    
    // MARK: - Instance Properties
    
    public var data: [String : Any?]
    
    public var meta: ControllersFeatureUpdate.Meta
    
    // MARK: - Init Methods
    
    public init(_ data: [String : Any?]) {
        self.data = data
        self.meta = ControllersFeatureUpdate.Meta(.input)
    }
    
}
