//
//  DropsRequiredView.swift
//  eleos_L
//
//  Created by Razan Raid on 27/08/2023.
//

import SwiftUI

struct DropsRequiredView: View {
    var plants: Plant
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 170,height: 75)
                .cornerRadius(10)
                .foregroundColor(Color("bg"))
                
            HStack(alignment: .center, spacing:0){
                ForEach(0..<plants.dropsNeeded, id: \.self) { index in
                    Image("drop2")
                        .resizable()
                    .frame(width: 30, height: 30)}
            }
        }
    }
}
struct DropsRequiredView_Previews: PreviewProvider {
    static var previews: some View {
        DropsRequiredView(plants: plantsData[0])
    }
}
