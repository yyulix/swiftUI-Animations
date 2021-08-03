//
//  ContentView.swift
//  loader-animation
//
//  Created by Yulia on 31.07.2021.
//

import SwiftUI

struct ContentView: View {
        
    @State var isAnimated = true
    
    var body: some View {
        VStack(alignment: .center) {
            Text("@its.yulix")
                .padding()
            Spacer()
            ZStack {
                
                Circle()
                    .trim(from: 0.5, to: 1.0)
                    .rotation(isAnimated ? .degrees(360) : .degrees(0))
                    .stroke(Color(hex: 0xAA0D91) ,style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: 225, height: 225)
                
                Circle()
                    .trim(from: 0.55, to: 1.0)
                    .rotation(isAnimated ? .degrees(720) : .degrees(0))
                    .stroke(Color(hex: 0xF2248C) ,style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: 190, height: 190)
                
                Circle()
                    .trim(from: 0.6, to: 1.0)
                    .rotation(isAnimated ? .degrees(1080) : .degrees(0))
                    .stroke(Color(hex: 0xAB64FF) ,style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: 155, height: 155)
                
                Circle()
                    .trim(from: 0.65, to: 1.0)
                    .rotation(isAnimated ? .degrees(360) : .degrees(0))
                    .stroke(Color(hex: 0x66DAFF) ,style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: 120, height: 120)
                
                Circle()
                    .trim(from: 0.7, to: 1.0)                    .rotation(isAnimated ? .degrees(360) : .degrees(0))
                    .rotation(isAnimated ? .degrees(720) : .degrees(0))
                    .stroke(Color(hex: 0xA9FFEA), style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: 85, height: 85)
                
                Circle()
                    .trim(from: 0.75, to: 1.0)
                    .rotation(isAnimated ? .degrees(1080) : .degrees(0))
                    .stroke(Color(hex: 0x56D0B3) ,style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: 50, height: 50)
            }
            .animation(Animation.linear.repeatCount(3, autoreverses: false).speed(1/16))
            .onAppear() {
                self.isAnimated.toggle()
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
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
