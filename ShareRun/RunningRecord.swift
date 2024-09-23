//
//  RunningRecord.swift
//  ShareRun
//
//  Created by 김시종 on 9/23/24.
//

import Foundation
import CoreLocation

struct RunningRecord: Identifiable {
    let id = UUID()
    var distance: Double
    var bpm: Int
    var cadence: Int
    var route: [CLLocationCoordinate2D]
    var duration: TimeInterval
    var startDate: Date
}

