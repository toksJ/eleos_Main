//
//  TabsView.swift
//  eleos_L
//
//  Created by TokaJaber on 22/08/2023.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
    
                    TabView {
                        Home()
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Home")
                            }
                        
                        CircularProgressView(progress: 0.5, score: 1, totalLevels: 5)
                            .tabItem {
                                Image(systemName: "drop.circle")
                                Text("progress")
                            }
                    
                        PlantListView()
                            .tabItem {
                                Image(systemName: "leaf.fill")
                                Text("Plants")
                            }
                        Schedule()
                            .tabItem {
                                Image(systemName: "calendar.badge.clock")
                                Text("Schedule")
                            }
                    }
            
                        }
                
                
            }
            


struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
