//
//  RunningView.swift
//  ShareRun
//
//  Created by 김시종 on 10/1/24.
//

import SwiftUI
import ComposableArchitecture
import CoreLocation
import MapKit

struct RunningView: View {
    let store: StoreOf<RunningFeature>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                if viewStore.isRunning {
                    // Running state
                    Text("Running...")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                    
                    // Show map with current region
                    if let mapRegion = viewStore.mapRegion {
                        Map(coordinateRegion: .constant(mapRegion), showsUserLocation: true)
                            .frame(height: 300)
                    }

                    // Display heart rate and cadence
                    HStack {
                        VStack {
                            Text("Heart Rate")
                            Text("\(viewStore.heartRate) BPM")
                                .font(.title2)
                                .bold()
                        }
                        .padding()
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(10)

                        VStack {
                            Text("Cadence")
                            Text("\(viewStore.cadence) RPM")
                                .font(.title2)
                                .bold()
                        }
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                    }

                    // Stop Running Button
                    Button(action: {
                        viewStore.send(.stopRunning)
                    }) {
                        Text("Stop Running")
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                } else {
                    // Idle state, ready to start running
                    Text("Ready to Run")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.orange.opacity(0.2))
                        .cornerRadius(10)

                    // Start Running Button
                    Button(action: {
                        viewStore.send(.startRunning)
                    }) {
                        Text("Start Running")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
        }
    }
}
