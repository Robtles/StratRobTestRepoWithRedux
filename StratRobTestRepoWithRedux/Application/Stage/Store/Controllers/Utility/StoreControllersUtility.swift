//
//  StoreControllersUtility.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



public struct StoreControllersUtility {
    
    
    
}


public protocol StoreControllersUtilityProtocol: StoreProtocol, OldPropsProtocol {
    
    var opened: Bool { get }
    
    var shouldPerformCompletion: Bool { get }
    
    var wasOpened: Bool { get }
    
}

public extension StoreControllersUtilityProtocol {
    
    public var opened: Bool {
        return self.data["opened"] as? Bool ?? false
    }
    
    public var shouldPerformCompletion: Bool {
        return self.data["perform_completion"] as? Bool ?? false
    }
    
    public var wasOpened: Bool {
        return self.oldProps["opened"] as? Bool ?? false
    }
    
}
