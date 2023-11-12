//
//  PlantListView.swift
//  eleos_L
//
//  Created by Razan Raid on 27/08/2023.
//

import SwiftUI

struct PlantListView: View {
    
    @EnvironmentObject private var dropCounter : DropCounter
    @StateObject var plantManager = PlantManager()
    var todoManager = TodoManager()
    var body: some View {
        NavigationStack{
            List{
                ForEach($plantManager.plants) { $plant in
//                    if plant.shouldShowNavigationLink {
                    NavigationLink(destination: PlantDetailView(plants: plantsData, plant: plant, isUnlocked: plant.shouldShowNavigationLink)) {
                        PlantRowView(plant: plant)
                            .opacity(plant.shouldShowNavigationLink ? 1.0 : 0.5)
                    }
                    }// navigation link
                }// list
            .navigationTitle("Plants 🪴୭ ˚.ᵎᵎ")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                   CounterView(todoManager: todoManager)
                }
                }

                
            }
        
          

        }
    }
    struct PlantListView_Previews: PreviewProvider {
        static var previews: some View {
            PlantListView()
                .environmentObject(DropCounter())
        }
    }

