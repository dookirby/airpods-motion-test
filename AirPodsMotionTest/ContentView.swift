//
//  ContentView.swift
//  AirPodsMotionTest
//
//  Created by Boseok Son on 8/22/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var motionManager = MotionManager()
    
    var body: some View {
        VStack {
            Text("Pitch: \(motionManager.x, specifier: "%.2f")")
            Text("Roll: \(motionManager.y, specifier: "%.2f")")
            Text("Yaw: \(motionManager.z, specifier: "%.2f")")
        }
        .padding()
        .onAppear {
            motionManager.startUpdates()
        }
        .onDisappear {
            motionManager.stopUpdates()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
