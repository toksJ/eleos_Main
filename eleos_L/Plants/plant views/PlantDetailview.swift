//
//  PlantDetailview.swift
//  eleos_L
//
//  Created by Razan Raid on 27/08/2023.
//

import SwiftUI

struct PlantDetailView: View {
    
    @EnvironmentObject var dropCounter : DropCounter
    @EnvironmentObject var progressData: ProgressData
    var plants : [Plant]
    var plant : Plant
    @State var isUnlocked : Bool
    
    @State var notenoughwater = false
    @State var maxwater = false
    @State var level = 0
    @State var Done = false
    

    
    var body: some View {
        NavigationView{
            ScrollView() {
                
                if isUnlocked {
                    VStack(alignment: .leading,spacing: 0) {
                        
                        ZStack{
                            PlantHeaderView(plant: plant)
                            HStack{
                                Spacer(minLength: 30)
                                ProgressBar(value: Double(progressData.progress)/10, maxValue: Double(plant.dropsNeeded))
                                    .frame(height: 10)
                                Spacer(minLength: 30)
                            }.offset(y:150)
                        }
                                        
                     HStack(alignment: .center, spacing: 30){
                         Text(plant.Name)
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
                        
                        
                        
                        VStack(alignment:.leading, spacing: 0){
                            
                            Text("Description")
                                .padding(.horizontal)
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color("font"))
                            Text(plant.Description)
                                .padding()
                            Spacer()
            
                            
                            
                            
                            
                            HStack{
                                Spacer()
                               
                                if Done == false{
                                    Button{
                                        if dropCounter.dropCount >= plant.waterIntake {
                                            
                                            progressData.progress += Double(plant.waterIntake)
                                            dropCounter.minus(plant.waterIntake)
                                            notenoughwater = false }
                                        
                                        else {
                                            notenoughwater = true
                                        }
                                        if Int(progressData.progress) >= plant.dropsNeeded && level < 5 {
                                            level += 1
                                            plantsData[level].shouldShowNavigationLink = true
                                            maxwater = true
                                            Done = true
                                            
                                            
                                            
                                        }
                                    }
                                    
                                label: {
                                    Text("water the plant!")
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("Purple"))
                                    .cornerRadius(10)}

                                
                               Spacer()
                            }
                            
            
                        }
                        
                    }
                }
                else{
                    VStack{
                        Text("❔")
                            .font(.system(size: 200))
                            .bold()
                            .multilineTextAlignment(.center)
                            .offset(y:200)
                        
                        Text("do more tasks to unlock \(plant.Name)!")
                            .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                            .offset(y:200)
                    }
                        


                }
            }
            .alert(isPresented: $notenoughwater) {
                Alert(
                    title: Text(" ⭐️ Not enough water!!!💧🌱 "), message: Text(" work harder and gain more drops."),
                     dismissButton: .cancel(Text("ok"))
                     )}
        
            .alert(isPresented: $maxwater) {
                                    Alert(
                                        title: Text(" ⭐️ CONGRATS!! your \(plant.Name) is fully nurtured!! 🥳🎉 "), message: Text("youre doing great!! keep it up :) 🍃"),
                                         dismissButton: .cancel(Text("thanks!"))
                                         )}

            .navigationBarTitle(plant.Name,displayMode: .inline)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
        }// nav view
    }
    
}
struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plants: plantsData, plant: plantsData[0], isUnlocked: plantsData[0].shouldShowNavigationLink )
            .environmentObject(DropCounter())
            .environmentObject(ProgressData())
    }
}
