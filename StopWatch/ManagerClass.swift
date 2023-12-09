//
//  ManagerClass.swift
//  StopWatch
//
//  Created by Pravin Kumar on 08/12/23.
//

import Foundation
import SwiftUI
enum mode {
    case running
    case stopped
    case paused
}

class ManagerClass:ObservableObject {
    @Published var secondElapsed = 0.0
    @Published var mode: mode = .stopped
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ timer in
            self.secondElapsed += 0.1
        }
    }
    
    func stop() {
        timer.invalidate()
        secondElapsed = 0
        mode = .stopped
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
}
