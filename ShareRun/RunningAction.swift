//
//  RunningAction.swift
//  ShareRun
//
//  Created by 김시종 on 9/25/24.
//

import Foundation
import MapKit

enum RunningAction: Equatable {
    case startRunning
    case stopRunning
    case locationUpdated(CLLocationCoordinate2D)
    case heartRateUpdated(Int)
    case cadenceUpdated(Int)
    case authorizationStatusChanged(CLAuthorizationStatus)
    case mapRegionChanged(MKCoordinateRegion)
}
