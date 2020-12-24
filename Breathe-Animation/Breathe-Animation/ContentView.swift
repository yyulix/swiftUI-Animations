//
//  ContentView.swift
//  Breathe-Animation
//
//  Created by Y u l i a on 24.12.2020.
//  Copyright © 2020 Yulia. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State var scaleState = false
    @State var rotateState = false
    @State var moveState = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    
                    Group {
                        Circle().fill(Color.white)
                    }
                    .frame(width: 305, height: 305, alignment: .center)
                    .opacity(0.1)
                    
                    ZStack {
                        
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.init(red: 0, green: 0.6, blue: 0.6), .white]), startPoint: .top, endPoint: .bottom))
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                        .offset(y: moveState ? -60 : 0)
                        .opacity(0.5)
                        
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.init(red: 0, green: 0.75, blue: 0.45), .white]), startPoint: .bottom, endPoint: .top))
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                        .offset(y: moveState ? 60 : 0)
                        .opacity(0.5)
                        
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.init(red: 0, green: 0.65, blue: 0.55), .white]), startPoint: .top, endPoint: .bottom))
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                        .offset(y: moveState ? -60 : 0)
                        .opacity(0.5)
                        .rotationEffect(.degrees(60))
                    
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.init(red: 0, green: 0.7, blue: 0.5), .white]), startPoint: .bottom, endPoint: .top))
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                        .offset(y: moveState ? 60 : 0)
                        .opacity(0.5)
                        .rotationEffect(.degrees(60))
                        
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.init(red: 0, green: 0.7, blue: 0.5), .white]), startPoint: .top, endPoint: .bottom))
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                        .offset(y: moveState ? -60 : 0)
                        .opacity(0.5)
                        .rotationEffect(.degrees(120))
                        
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.init(red: 0, green: 0.65, blue: 0.55), .white]), startPoint: .bottom, endPoint: .top))
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                        .offset(y: moveState ? 60 : 0)
                        .opacity(0.5)
                        .rotationEffect(.degrees(120))
                    }
                    .rotationEffect(.degrees(rotateState ? 90 : 0))
                    .scaleEffect(scaleState ? 1 : 1/5)
                    .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
                    .onAppear() {
                        self.rotateState.toggle()
                        self.scaleState.toggle()
                        self.moveState.toggle()
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
