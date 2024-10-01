//
//  ShareRunApp.swift
//  ShareRun
//
//  Created by 김시종 on 9/23/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct ShareRunApp: App {
    let store = Store(
        initialState: RunningFeature.RunningState(),
        reducer: RunningFeature()
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
