//
//  CircularProgressView.swift
//  eleos_L
//
//  Created by TokaJaber on 23/08/2023.
//

import SwiftUI

struct CircularProgressView: View {

    var progress: CGFloat

    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.blue)



            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: 20.0,lineCap: .round,lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270))

            Image("plant 1")
                .resizable()
                .scaledToFit()
                .offset(x: 25, y: -8)
            
        }
    }
}

struct levelView: View {

    var score: Int
    var totallevels: Int


    var body: some View{
        VStack{
            CircularProgressView(progress: CGFloat(score) /
                                 CGFloat(totallevels))
            .frame(width: 300, height: 300)




            HStack(alignment:.center,spacing:2){
                Spacer(minLength: 0)



                Button {
                    withAnimation{
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .offset(x:-100)
                                   }


                HStack(alignment: .center){
                    Text("your level !")
                        .bold()
                        .padding()
                        .font(.system(size:25))
                        .offset(x:-101)

                            }



                Button {
                    withAnimation{

                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .offset()
                        .offset(x:-100 )



                }

            }

            Text("\(score)/\(totallevels)")
                .font(.system(size:25))
                .bold()
                .padding()
            

        }
    }
}



struct levelView_Previews: PreviewProvider {
    static var previews: some View {
        levelView(score: 2, totallevels: 5)
    }
}

