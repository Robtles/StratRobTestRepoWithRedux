//
//  Date+Extension.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 04/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation


extension Date {
    
    static var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    }
    
}
