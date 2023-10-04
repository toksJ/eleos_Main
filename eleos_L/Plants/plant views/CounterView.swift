//
//  CounterView.swift
//  eleos_L
//
//  Created by Razan Raid on 02/10/2023.
//

import SwiftUI

struct CounterView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    @State private var dropsCount: Int = 0
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 80,height: 50)
                .foregroundColor(Color("bg"))
                .cornerRadius(6)
            
            HStack{
                Image("drops")
                    .resizable()
                    .frame(width: 40,height: 40)
                Text("\(dropsCount)")
                    .offset(x:-5)
                    .onAppear(){
                        for todo in todoManager.todos {
                            if todo.isCompleted{
                                dropsCount+=1
                            }
                        }
                        
                    }
            }
        
        }
        
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(todoManager: TodoManager())
    }
}
