//
//  PlantDetailview.swift
//  eleos_L
//
//  Created by Razan Raid on 27/08/2023.
//

import SwiftUI

struct PlantDetailView: View {
    
    @EnvironmentObject var dropCounter : DropCounter
    var plant : Plant
    @State var dropsGiven = 0
    @State var notenoughwater = false

    
    var body: some View {
        NavigationView{
            ScrollView() {
                VStack(alignment: .leading,spacing: 0) {
                    
                    ZStack{
                        PlantHeaderView(plant: plant)
                        HStack{
                            Spacer(minLength: 30)
                            ProgressBar(value: Double(dropsGiven)/10, maxValue: Double(plant.dropsNeeded))
                                .frame(height: 10)
                            Spacer(minLength: 30)
                        }.offset(y:150)
                    }
                                    
                 HStack(alignment: .center, spacing: 30){
                        Text(plant.plantName)
                            .font(.largeTitle)
                            .bold()
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                            .padding()
                        Spacer(minLength: 0.1)
                        DropsRequiredView(plant: plant)
                            .frame(width:100)
                        Spacer()
                        
                        
                    }
                    
                    
                    // description
                    VStack(alignment:.leading, spacing: 0){
                        Text("Description")
                            .padding(.horizontal)
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("font"))
                        Text(plant.plantDescription)
                            .padding()
                        Spacer()
                 //
//
                        
                        
//                        CircularProgressView(progress: CGFloat(dropsGiven) ,plant: plant)
//                            .offset(x:15)
                        HStack{
                            Spacer()
                           
                            
                            Button{
                                if dropCounter.dropCount >= plant.waterIntake{
                                    dropsGiven += (dropCounter.dropCount-plant.waterIntake)
                                    dropCounter.dropCount-plant.waterIntake
                                }
                                else {
                                    notenoughwater = true
                                }
                            }label: {
                                Text("water the plant!")
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("Purple"))
                            .cornerRadius(10)
                            
                           Spacer()
                        }
                        
                        .alert(isPresented: $notenoughwater) {
                            Alert(
                                title: Text("Not enough water!!! work harder and gain more drops.💧🌱 "),
                                 dismissButton: .cancel(Text("ok"))
                                 )}
                    
                        
                        ///
                        ///
                        
                        
                    }// vstack
                    
                    
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
