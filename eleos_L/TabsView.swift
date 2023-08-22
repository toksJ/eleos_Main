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
                        
                        CircularProgressView(progress: 0.25 )
                            .tabItem {
                                Image(systemName: "drop.circle")
                                Text("progress")
                            }
                    
                        Plants()
                            .tabItem {
                                Image(systemName: "xmark.bin")
                                Text("Plants")
                            }
                        Schedule()
                            .tabItem {
                                Image(systemName: "doc.text.image")
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
