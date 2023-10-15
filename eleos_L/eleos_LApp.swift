//
//  eleos_LApp.swift
//  eleos_L
//
//  Created by TokaJaber on 21/08/2023.
//

import SwiftUI

@main
struct eleos_LApp: App {
    
    @StateObject var dropCounter = DropCounter()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dropCounter)
        }
    }
}
