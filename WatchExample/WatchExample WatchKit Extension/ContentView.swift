//
//  ContentView.swift
//  WatchExample WatchKit Extension
//
//  Created by Nitin Bhatt on 10/27/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var seconds:Int = 0
    @State var minutes:Int = 0

    @State var isTimerStarted = false
    @State var isTimerStopped = false
    
    var timer = Timer()
        
    func incrementTimer(){
        
        if isTimerStopped == true{
            return
        }
        
        if seconds <= 59{
            seconds = seconds + 1
            let seconds = 1.0
            Timer.scheduledTimer(withTimeInterval: seconds, repeats: false) { timer in
                incrementTimer()
            }
        }else if seconds == 60{
            minutes = minutes + 1
            seconds = 0
            incrementTimer()
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Text(String(String(format: "%02d", minutes))).font(.largeTitle)
                Text(":").font(.largeTitle)
                Text(String(String(format: "%02d", seconds))).font(.largeTitle)
            }
        
            HStack{
                if isTimerStarted == false{
                    Button(action: {
                        isTimerStarted = true
                        isTimerStopped = false
                        incrementTimer()
                    }){
                      Text("Start")
                    }.frame(width: 120)
                }
                
                if isTimerStarted == true{
                    Button(action: {
                        seconds = 00
                        minutes = 00
                        isTimerStopped = true
                        isTimerStarted = false
                    }){
                      Text("Reset")
                    }
                }
                
                if isTimerStarted == true{
                    Button(action: {
                        isTimerStopped = true
                        isTimerStarted = false
                    }){
                      Text("Stop")
                    }
                }
                
            }.frame(width: 180)
       
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
