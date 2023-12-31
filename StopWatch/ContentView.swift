//
//  ContentView.swift
//  StopWatch
//
//  Created by Pravin Kumar on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var managerClass = ManagerClass()
    @State private var lapTimings: [LapClass] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text(String(format: "%.2f", managerClass.secondElapsed))
                    .font(.largeTitle)
                // intial formated time
                switch managerClass.mode {
                case .stopped:
                    withAnimation {
                        createButton(imageName: "play.fill", color: .green) {
                            managerClass.start()
                        }
                    }
                    //create stop button
                case .running:
                    HStack {
                        withAnimation {
                            createButton(imageName: "stop.fill", color: .red) {
                                managerClass.stop()
                                lapTimings = []
                            }
                        }
                        withAnimation {
                            createButton(imageName: "stopwatch.fill", color: .green) {
                                let newLap = LapClass(managerClass.secondElapsed)
                                lapTimings.append(newLap)
                            }
                        }
                        withAnimation {
                            createButton(imageName: "pause.fill", color: .orange) {
                                managerClass.pause()
                            }
                        }
                    }
                    //show the 3 options when the app is runnig
                case .paused:
                    HStack {
                        withAnimation {
                            createButton(imageName: "stop.fill", color: .red) {
                                managerClass.stop()
                                lapTimings = []
                            }
                        }
                        withAnimation {
                            createButton(imageName: "play.fill", color: .blue) {
                                managerClass.start()
                            }
                        }
                    }
                }
                //show 2 options when the app is not running
                
                Spacer()
                
                
                List(lapTimings) { lap in
                    Text("\(String(format: "%.2f", lap.lap)) s")
                }//show lap timings as list
                
            }
            .navigationTitle("Stop Watch App")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
    
    private func createButton(imageName: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: imageName)
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .background(color)
                .cornerRadius(100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
