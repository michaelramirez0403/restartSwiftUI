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
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: - HEADER
                Spacer()
                ZStack {
                    CircleGroupView(ShapeColor: .gray,
                                    ShapeOpacity: 0.1 )
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(
                            .easeInOut(duration: 4)
                            .repeatForever(),
                            value: isAnimating
                        )
                    //                MARK: Commented code
                    //                        .offset(x: imageOffset.width * 1.2, y: 0)
                    //                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                    //                        .gesture(
                    //                            DragGesture()
                    //                                .onChanged { gesture in
                    //                                    if abs(imageOffset.width) <= 150 {
                    //                                        imageOffset = gesture.translation
                    //                                    }
                    //                                }
                    //                                .onEnded({ _ in
                    //                                    imageOffset = .zero
                    //                                })
                    //                        )
                    //                        .animation(.easeInOut(duration: 1),
                    //                                   value: imageOffset)
                }
                // MARK: - CENTER
                Text("The time that leads to mastery is dependent on the intensity of our focus.")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                // MARK: - FOOTER
                Spacer()
                Button(action: {
                    // Some Action
                    withAnimation {
                        playSound(sound: "success",
                                  type: "m4a")
                        isOnboardingViewActive = true
                    }
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large )
                    Text("Restart")
                        .font(.system(.title3,
                                      design: .rounded))
                        .fontWeight(.bold )
                }//: BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            } //: VSTACK
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75,
                                              execute: {
                    isAnimating = true
                })
            }
            .preferredColorScheme(.white)
        }
    }
}

#Preview {
    HomeView()
}
