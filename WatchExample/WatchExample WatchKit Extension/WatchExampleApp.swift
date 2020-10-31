//
//  WatchExampleApp.swift
//  WatchExample WatchKit Extension
//
//  Created by Nitin Bhatt on 10/27/20.
//

import SwiftUI

@main
struct WatchExampleApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
