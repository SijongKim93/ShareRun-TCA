//
//  HealthKitManager.swift
//  ShareRun
//
//  Created by 김시종 on 9/24/24.
//

import Combine
import HealthKit

class HealthKitManager {
    private let healthStore = HKHealthStore()
    private let heartRateSubject = PassthroughSubject<Int, Never>()
    private let cadenceSubject = PassthroughSubject<Int, Never>()
    
    func startHeartRateUpdates() -> AnyPublisher<Int, Never> {
        // 실시간 심박수 업데이트 로직
        return heartRateSubject.eraseToAnyPublisher()
    }
    
    func startCadenceUpdates() -> AnyPublisher<Int, Never> {
        // 실시간 케이던스 업데이트 로직
        return cadenceSubject.eraseToAnyPublisher()
    }
    
    func stopUpdates() {
        // 업데이트 중지 로직
    }
}
