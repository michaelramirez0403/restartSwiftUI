//
//  CircleGroupView.swift
//  Restart
//
//  Created by Macky Ramirez on 12/27/24.
//
import SwiftUI
struct CircleGroupView: View {
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack() {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),
                        lineWidth: 40)
                .frame(width: 260,
                       height: 260,
                       alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),
                        lineWidth: 80)
                .frame(width: 260,
                       height: 260,
                       alignment: .center)
        } //: ZStack
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(
            .easeInOut(duration: 2.75)
            .repeatForever(),
            value: isAnimating
        )
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea(.all,
                             edges: .all)
        CircleGroupView(ShapeColor: .white,
                        ShapeOpacity: 0.2)
    }
}
