//
//  LapClass.swift
//  StopWatch
//
//  Created by Pravin Kumar on 08/12/23.
//

import Foundation

import SwiftUI

struct LapClass:Identifiable {
    var id = UUID()
    let lap:Double
    init(_ lap: Double) {
        self.lap = lap
    }
}
