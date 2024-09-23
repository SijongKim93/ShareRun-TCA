//
//  RunningAction.swift
//  ShareRun
//
//  Created by 김시종 on 9/23/24.
//

import Foundation


enum RunningAction: Equatable {
    case startRunning
    case stopRunning
    case locationUpdated(CLLocation)
    case heartRateUpdated(Int)
    case cadenceUpdated(Int)
    case authorizationStatusChanged(CLAuthorizationStatus)
    case mapRegionChanged(MKCoordinateRegion)
}
