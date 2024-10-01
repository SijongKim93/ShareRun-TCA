//
//  RunningState.swift
//  ShareRun
//
//  Created by 김시종 on 9/23/24.
//

import ComposableArchitecture
import CoreLocation
import MapKit
import Combine

@Reducer
struct RunningFeature {
    @ObservableState
    struct RunningState: Equatable {
        var record: RunningRecord?
        var isRunning: Bool = false
        var currentLocation: CLLocationCoordinate2D?
        var mapRegion: MKCoordinateRegion?
        var authorizationStatus: CLAuthorizationStatus = .notDetermined
        var heartRate: Int = 0
        var cadence: Int = 0
        var locationHistory: [CLLocationCoordinate2D] = []
        var startTime: Date?
        var endTime: Date?
        var distance: Double = 0.0
    }
    
    enum RunningAction {
        case startRunning
        case stopRunning
        case locationUpdated(CLLocationCoordinate2D)
        case heartRateUpdated(Int)
        case cadenceUpdated(Int)
        case authorizationStatusChanged(CLAuthorizationStatus)
        case mapRegionChanged(MKCoordinateRegion)
        case saveRunRecord
    }
    
    var body: some ReducerOf<Self> {
        Reduce { State, action in
            switch action {
                
            case .startRunning:
                state.isRunning = true
                state.startTime = Date()
                state.locationHistory = []
                state.distance = 0.0
                
                let locationStream = locationManager.startUpdatingLocation()
                    .map { Action.locationUpdated($0.coordinate) }
                    .receive(on: mainQueue)
                    .eraseToEffect()
                
                let heartRateStream = healthKitManager.startHeartRateUpdates()
                    .map(Action.heartRateUpdated)
                    .receive(on: mainQueue)
                    .eraseToEffect()
                
                return .merge(locationStream, heartRateStream)
            }
        }
    }
}


