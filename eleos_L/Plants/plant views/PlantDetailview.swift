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
    var plant : Plant
    @State var isUnlocked : Bool
    @State var notenoughwater = false
    @State var maxwater = false

    
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
                                    if dropCounter.dropCount >= plant.waterIntake {
                                        progressData.progress += Double(plant.waterIntake)
                                        dropCounter.minus(plant.waterIntake)                                }
                                    else {
                                        notenoughwater = true
                                    }
                                    
                                    if dropCounter.dropCount == plant.dropsNeeded {
                                        maxwater = true
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
                                    title: Text(" ⭐️ Not enough water!!! work harder and gain more drops.💧🌱 "),
                                     dismissButton: .cancel(Text("ok"))
                                     )}
                        
    //                        .alert(isPresented: $maxwater) {
    //                            Alert(
    //                                title: Text(" ⭐️ CONGRATS!! your \(plant.plantName) is fully nurtured!! 🥳🎉 "), message: Text("youre doing great!! keep it up :) 🍃"),
    //                                 dismissButton: .cancel(Text("thanks!"))
    //                                 )}
                            
                            ///
                            ///
                            
                            
                        }// vstack
                        
                        
                    }
                }
                else{
                    VStack{
                        Text("❔")
                            .font(.system(size: 200))
                            .bold()
                            .multilineTextAlignment(.center)
                            .offset(y:200)
                        
                        Text("do more tasks to unlock \(plant.plantName)!")
                            .font(.system(size: 40))
                            .multilineTextAlignment(.center)
                            .offset(y:200)
                    }
                        
//                    Text("grow ur other plants to unlock" , plant.plantName + "!")
//                        .font(.caption)
//                        .bold()
//                        .multilineTextAlignment(.center)
//                        .padding(50)
//                        .font(.system(size: 70))

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
        PlantDetailView(plant: plantsData[0], isUnlocked: false)
            .environmentObject(DropCounter())
            .environmentObject(ProgressData())
    }
}
