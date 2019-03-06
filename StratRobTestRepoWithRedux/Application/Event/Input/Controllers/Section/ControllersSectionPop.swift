//
//  ControllersSectionPop.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



public struct ControllersSectionPop: Input {
    
    // MARK: - Instance Properties
    
    public var data: [String : Any?]
    
    public var meta: ControllersSectionPop.Meta = ControllersSectionPop.Meta(.input)
    
    // MARK: - Init Methods
    
    public init() {
        self.data = [:]
    }
    
    public init(_ data: [String : Any?]) {
        self.data = data
    }
    
}
