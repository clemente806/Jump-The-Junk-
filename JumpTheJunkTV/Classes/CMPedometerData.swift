//
//  CMPedometerData.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 25/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation

class CMPedometerData: NSObject{
    
    var currentCadence: NSNumber?
    
    func getCurrent()->NSNumber{
        return currentCadence!
    }
}

