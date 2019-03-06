//
//  Route.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 05/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



struct Route {

    var actionId: String
    
    var data: [String]
    
    init(action: String = "", data: [String] = []) {
        self.actionId = action
        self.data = data
    }
    
}
