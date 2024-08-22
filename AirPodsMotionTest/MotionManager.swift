//
//  MotionManager.swift
//  AirPodsMotionTest
//
//  Created by Boseok Son on 8/22/24.
//

import Foundation
import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager = CMHeadphoneMotionManager()
    
    @Published var x: Double = 0.0
    @Published var y: Double = 0.0
    @Published var z: Double = 0.0
    
    init() {
        startUpdates()
    }
    
    func startUpdates() {
        guard motionManager.isDeviceMotionAvailable else {
            print("헤드폰 모션 데이터를 사용할 수 없어요.")
            return
        }
        
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (motionData, error) in
            guard let data = motionData, error == nil else {
                print("모션데이터를 가져오는데 문제가 발생했어요: \(error?.localizedDescription ?? "알 수 없는 에러!!")")
                return
            }
            
            DispatchQueue.main.async {
                self.x = data.attitude.pitch
                self.y = data.attitude.roll
                self.z = data.attitude.yaw
            }
        }
    }
    
    func stopUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
}
