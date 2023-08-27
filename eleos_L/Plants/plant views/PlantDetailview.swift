//
//  PlantDetailview.swift
//  eleos_L
//
//  Created by Razan Raid on 27/08/2023.
//

import SwiftUI

struct PlantDetailView: View {
    var plant : Plant
    
    var body: some View {
        NavigationView{
            ScrollView() {
                VStack(alignment: .leading,spacing: 0) {
                    // header
                    PlantHeaderView(plant: plant)
                    //title
                    Text(plant.plantName)
                        .font(.largeTitle)
                        .bold()
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .padding()
                    // description
                    VStack(alignment:.leading, spacing: 0){
                        Text("Description")
                            .padding(.horizontal)
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("font"))
                        Text(plant.plantDescription)
                        .padding()}
                    
                      
                }
            }// vstack
            .navigationBarTitle(plant.plantName,displayMode: .inline)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
        }// nav view
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plant: plantsData[0])
    }
}
