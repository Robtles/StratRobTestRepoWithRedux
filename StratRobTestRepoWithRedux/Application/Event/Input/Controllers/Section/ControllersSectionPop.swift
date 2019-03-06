//
//  ControllersSectionPop.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



struct ControllersSectionPop: Input {
    
    // MARK: - Instance Properties
    
    var data: [String : Any?]
    
    var meta: ControllersSectionPop.Meta = ControllersSectionPop.Meta(.input)
    
    // MARK: - Init Methods
    
    init() {
        self.data = [:]
    }
    
    init(_ data: [String : Any?]) {
        self.data = data
    }
    
}
