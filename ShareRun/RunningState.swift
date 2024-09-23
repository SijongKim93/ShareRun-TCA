//
//  RunningState.swift
//  ShareRun
//
//  Created by 김시종 on 9/23/24.
//

import ComposableArchitecture
import MapKit

struct RunningState: Equatable {
    var record: RunningRecord?
    var isRunning: Bool = false
    var currentLocation: CLLocationCoordinate2D?
    var mapRegion: MKCoordinateRegion?
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    var heartRate: Int = 0
    var cadence: Int = 0
}
