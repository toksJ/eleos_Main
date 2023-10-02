//
//  PlantListView.swift
//  eleos_L
//
//  Created by Razan Raid on 27/08/2023.
//

import SwiftUI

struct PlantListView: View {
    
    var plants: [Plant] = plantsData
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(plants) { plant in
                    
                    NavigationLink(destination: PlantDetailView(plant: plant)) {
                        PlantRowView(plant: plant)
                    }// navigation link
                }// list
                .navigationTitle("Plants 🪴୭ ˚.ᵎᵎ")
               
            }
        }
    }
    struct PlantListView_Previews: PreviewProvider {
        static var previews: some View {
            PlantListView(plants: plantsData)
        }
    }
}
