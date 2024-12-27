//
//  HomeView.swift
//  Restart
//
//  Created by Macky Ramirez on 12/24/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Text("Home!")
                .font(.largeTitle)
            Button(action: {
                // Some Action
                isOnboardingViewActive = true
            }) {
                Text("Restart")
            }
        } //: VSTACK
        .padding()
    }
}

#Preview {
    HomeView()
}
