//
//  RunningButtonView.swift
//  ShareRun
//
//  Created by 김시종 on 10/1/24.
//

import SwiftUI
import ComposableArchitecture

struct RunningButtonView: View {
    let store: Store<RunningFeature.RunningState, RunningFeature.RunningAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            
        }
    }
}

#Preview {
    RunningButtonView()
}
