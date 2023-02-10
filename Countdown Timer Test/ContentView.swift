//
//  ContentView.swift
//  Countdown Timer Test
//
//  Created by Jack Kamaryt on 2/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var minutesRemaining = 59
    @State private var timeRemaining = 59
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Minutes: \(minutesRemaining)")
                    Text("Seconds: \(timeRemaining)")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(.black.opacity(0.75))
                        .clipShape(Capsule())
                }
                
                ZStack {
                    
                }
                .onReceive(timer) {time in
                    guard isActive else {return}
                    
                    if timeRemaining > 0
                    {
                        timeRemaining -= 1
                    }
                    if timeRemaining == 0
                    {
                        timeRemaining = 59
                        minutesRemaining -= 1
                    }
                }
                .onChange(of: scenePhase) { newPhase in
                    if newPhase == .active {
                        isActive = true
                    } else {
                        isActive = false
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
