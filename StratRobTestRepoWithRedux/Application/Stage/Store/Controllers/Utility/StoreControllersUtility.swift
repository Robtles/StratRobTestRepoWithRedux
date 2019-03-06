//
//  StoreControllersUtility.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



struct StoreControllersUtility {
    
    
    
}


protocol StoreControllersUtilityProtocol: StoreProtocol, OldPropsProtocol {
    
    var opened: Bool { get }
    
    var shouldPerformCompletion: Bool { get }
    
    var wasOpened: Bool { get }
    
}

extension StoreControllersUtilityProtocol {
    
    var opened: Bool {
        return self.data["opened"] as? Bool ?? false
    }
    
    var shouldPerformCompletion: Bool {
        return self.data["perform_completion"] as? Bool ?? false
    }
    
    var wasOpened: Bool {
        return self.oldProps["opened"] as? Bool ?? false
    }
    
}
