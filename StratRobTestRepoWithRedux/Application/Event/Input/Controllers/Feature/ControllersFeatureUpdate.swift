//
//  ControllersFeatureUpdate.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



struct ControllersFeatureUpdate: Input {
    
    // MARK: - Instance Properties
    
    var data: [String : Any?]
    
    var meta: ControllersFeatureUpdate.Meta
    
    // MARK: - Init Methods
    
    init(_ data: [String : Any?]) {
        self.data = data
        self.meta = ControllersFeatureUpdate.Meta(.input)
    }
    
}
