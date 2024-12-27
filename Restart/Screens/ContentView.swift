//
//  ContentView.swift
//  Restart
//
//  Created by Macky Ramirez on 12/24/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        ZStack {
            //isOnboardingViewActive ? OnboardingView() : HomeView()
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
