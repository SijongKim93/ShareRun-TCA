//
//  RunningEnvironment.swift
//  ShareRun
//
//  Created by 김시종 on 9/23/24.
//

import Foundation
import CombineSchedulers

struct RunningEnvironment {
    var locationManager: LocationManager
    var healthKitManager: HealthKitManager
    var mainQueue: AnySchedulerOf<DispatchQueue>
}
