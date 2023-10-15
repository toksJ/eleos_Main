//
//  CircularProgressView.swift
//  eleos_L
//
//  Created by TokaJaber on 23/08/2023.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var PlantAnimation = false
    
    var progress: CGFloat
    var plant : Plant
    var score: Int
    var totalLevels: Int
    
    var body: some View {
        
        VStack {
            ZStack{
//                Image(colorScheme == .dark ? "bg 2":"bg 1")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 400, height: 400)
                
                
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(Color("Purple"))
                    .padding(25)
                
                    .frame(width: 375, height: 375)
                
                
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: .init(lineWidth: 20.0,lineCap: .round,lineJoin: .round))
                    .foregroundColor(Color("Purple"))
                    .rotationEffect(Angle(degrees: 270))
                    .padding(25)
                    
                    .frame(width: 375, height: 375)
                
                Image(plant.plantFullPic)
                    .resizable()
                    .scaledToFit()
                    .offset(x: plant.isMonstera ? 15 : 0, y: plant.isMonstera ? -4 : 0)
                    .frame(width: 300, height: 300)
                    .onAppear(){
                        withAnimation(.easeOut(duration: 0.5)) {
                            PlantAnimation = true
                        }
                        
                    }
                    .onDisappear(){
                        PlantAnimation = false
                    }
            }
                            }
            
            
            //            HStack(alignment:.center,spacing:2){
            //                Spacer(minLength: 0)
            //
            //
            //
            //                Button {
            //                    withAnimation{
            //                    }
            //                } label: {
            //                    Image(systemName: "chevron.left")
            //                        .font(.title2)
            //                        .offset(x:-100)
            //                                   }
            //
            //
            //                HStack(alignment: .center){
            //                    Text("your level !")
            //                        .bold()
            //                        .padding()
            //                        .font(.system(size:25))
            //                        .offset(x:-101)
            //
            //                            }
            //
            //
            //
            //                Button {
            //                    withAnimation{
            //
            //                    }
            //                } label: {
            //                    Image(systemName: "chevron.right")
            //                        .font(.title2)
            //                        .offset()
            //                        .offset(x:-100 )
            //
            //
            //
            //                }
            //
            //            }
            
            //            Text("\(score)/\(totalLevels)")
            //                .font(.system(size:25))
            //                .bold()
            //                .padding()
            
        }
        
        
    }
    
    
    
    
    struct CircularProgressView_Previews: PreviewProvider {
        static var previews: some View {
            CircularProgressView(progress: 0.3, plant: plantsData[0], score: 1, totalLevels: 3)
        }
    }
    

