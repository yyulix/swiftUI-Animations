//
//  ContentView.swift
//  loading-animation
//
//  Created by Y u l i a on 31.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    let darkGradient = Gradient(colors: [Color(UIColor(red: 0.192, green: 0.212, blue: 0.329, alpha: 1.000)), Color(UIColor(red: 0.565, green: 0.608, blue: 0.667, alpha: 1.000))])
    
    @State private var ball1Pos: CGFloat = -75
    @State private var ball2Pos: CGFloat = 0
    @State private var ball3Pos: CGFloat = 75
    @State private var ball4Pos: CGFloat = 150
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            Capsule()
                .foregroundColor(.white)
                .frame(width: 190, height: 470)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            
            ZStack{
                Capsule()
                    .stroke(Color.white, lineWidth: 10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .clipShape(
                        Capsule()
                    )
                    .shadow(color: Color.white.opacity(0.7), radius: 2, x: -2, y: -2)
                    .clipShape(
                        Capsule()
                    )
                    .frame(width: 150, height: 430)
            }
            .mask(Capsule().frame(width: 150, height: 430))
            
            Rectangle()
                .fill(LinearGradient(gradient: darkGradient, startPoint: .leading, endPoint: .trailing))
                .frame(width: 30, height: 30)
                .offset(x: 0, y: ball1Pos)
            
            Rectangle()
                .fill(LinearGradient(gradient: darkGradient, startPoint: .leading, endPoint: .trailing))
                .frame(width: 30, height: 30)
                .offset(x: 0, y: ball2Pos)
            
            Rectangle()
                .fill(LinearGradient(gradient: darkGradient, startPoint: .leading, endPoint: .trailing))
                .frame(width: 30, height: 30)
                .offset(x: 0, y: ball3Pos)
            
            Rectangle()
                .fill(LinearGradient(gradient: darkGradient, startPoint: .leading, endPoint: .trailing))
                .frame(width: 30, height: 30)
                .offset(x: 0, y: ball4Pos)
            
            Ball()
            
        }
        .onAppear {
            self.animate()
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
                self.animate()
            }
        }
    }
    func animate() {
        withAnimation(Animation.linear(duration: 0.5)) {
            self.ball1Pos = -150
        }
        withAnimation(Animation.easeInOut(duration: 0.5).delay(0.5)) {
            self.ball2Pos = -75
        }
        withAnimation(Animation.easeInOut(duration: 0.5).delay(1.0)) {
            self.ball3Pos = 0
        }
        withAnimation(Animation.easeInOut(duration: 0.5).delay(1.5)) {
            self.ball4Pos = 75
        }
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2.0) {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.ball4Pos = 150
            }
            withAnimation(Animation.easeInOut(duration: 0.5).delay(0.5)) {
                self.ball3Pos = 75
            }
            withAnimation(Animation.easeInOut(duration: 0.5).delay(1.0)) {
                self.ball2Pos = 0
            }
            withAnimation(Animation.easeInOut(duration: 0.5).delay(1.5)) {
                self.ball1Pos = -75
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Ball: View {
    let lightGradient = Gradient(colors: [Color(UIColor(red: 0.01, green: 0.67, blue: 0.69, alpha: 1.00)),
                                          Color(UIColor(red: 0.00, green: 0.80, blue: 0.67, alpha: 1.00))])
    @State private var flag = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: lightGradient, startPoint: .leading, endPoint: .trailing))
                .frame(width: 30, height: 30).offset(x: -15, y: -15)
                .modifier(Follow(pct: self.flag ? 1 : 0, path: BallPath.createPath(in: CGRect(x: 0, y: 0, width: 100, height: 300))))
                .offset(x: -35, y: -135)
                .onAppear {
                    withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                        self.flag.toggle()
                    }
            }
        }
    }
}

struct Follow: GeometryEffect {
    var pct: CGFloat = 0
    let path: Path

    var animatableData: CGFloat {
        get { return pct }
        set { pct = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let pt = percentPoint(pct)
        return ProjectionTransform(CGAffineTransform(translationX: pt.x, y: pt.y))
    }

    func percentPoint(_ percent: CGFloat) -> CGPoint {

        let pct = percent > 1 ? 0 : (percent < 0 ? 1 : percent)

        let f = pct > 0.999 ? CGFloat(1-0.001) : pct
        let t = pct > 0.999 ? CGFloat(1) : pct + 0.001
        let tp = path.trimmedPath(from: f, to: t)

        return CGPoint(x: tp.boundingRect.midX, y: tp.boundingRect.midY)
    }
}

struct BallPath: Shape {
    func path(in rect: CGRect) -> Path {
        return BallPath.createPath(in: rect)
    }

    static func createPath(in rect: CGRect) -> Path {

        let midX = rect.midX

        var path = Path()

        path.move(to: CGPoint(x: midX, y: rect.minY))
        
        path.addArc(center: CGPoint(x: midX, y: 100.0), radius: 1.0, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
        
        path.addArc(center: CGPoint(x: midX, y: 100.0*3), radius: 1.0, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        
        path.addArc(center: CGPoint(x: midX, y: 100.0*5), radius: 1.0, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
        
        path.addArc(center: CGPoint(x: midX, y: 100.0*7), radius: 1.0, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        
        
        path.addArc(center: CGPoint(x: midX, y: 100.0*7), radius: 1.0, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: true)
        
        path.addArc(center: CGPoint(x: midX, y: 100.0*5), radius: 1.0, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: false)
        
        path.addArc(center: CGPoint(x: midX, y: 100.0*3), radius: 1.0, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: true)
        
        path.addArc(center: CGPoint(x: midX, y: 100.0), radius: 1.0, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: false)
        
        return path
    }
}
