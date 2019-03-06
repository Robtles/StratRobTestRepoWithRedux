//
//  ControllersFeatureDelete.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



struct ControllersFeatureDelete: Input {
    
    // MARK: - Instance Properties
    
    var data: [String : Any?]
    
    var meta: ControllersFeatureDelete.Meta
    
    // MARK: - Init Methods
    
    init() {
        self.data = [:]
        self.meta = ControllersFeatureDelete.Meta(.input)
    }
    
    init(_ data: [String : Any?]) {
        self.init()
    }
    
}
