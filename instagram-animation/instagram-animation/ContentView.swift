//
//  ContentView.swift
//  instagram-animation
//
//  Created by Y u l i a on 31.07.2021.
//

import SwiftUI

struct ContentView: View {
        
    var firstGradient = [Color(hex: 0xAA0D91), Color(hex: 0x66DAFF), Color(hex: 0xF2248C), Color(hex: 0xAA0D91)]
    @State var hueRotationValue = -30.0

    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(
                            AngularGradient(gradient: Gradient(colors: firstGradient), center: .center)
                            )
                        .hueRotation(Angle(degrees: self.hueRotationValue))
                        .frame(width: 210, height: 210, alignment: .center)
                        .cornerRadius(40.0)
                    Rectangle()
                        .fill(
                            Color(.white)
                            )
                        .frame(width: 170, height: 170, alignment: .center)
                        .cornerRadius(30.0)
                    
                    Rectangle()
                        .fill(
                                AngularGradient(gradient: Gradient(colors: firstGradient), center: .center)
                            )
                        .hueRotation(Angle(degrees: self.hueRotationValue))
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(50.0)
                    
                    Rectangle()
                        .fill(
                            Color(.white)
                            )
                        .frame(width: 60, height: 60, alignment: .center)
                        .cornerRadius(30.0)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: 0xF2248C), Color(hex: 0xAA0D91)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                        .hueRotation(Angle(degrees: self.hueRotationValue))
                        .frame(width: 30, height: 30, alignment: .center)
                        .offset(x: 60.0, y: -60.0)
                }
                .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/2))
                .onAppear() {
                    self.hueRotationValue = 20.0

                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
