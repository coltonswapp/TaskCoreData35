//
//  DateHelper.swift
//  TaskCoreData35
//
//  Created by Colton Swapp on 7/29/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation
extension Date {
    
    func stringValue() -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        
        return df.string(from: self)
    }
    
}
