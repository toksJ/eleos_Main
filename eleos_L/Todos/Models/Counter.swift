//
//  Counter.swift
//  eleos_L
//
//  Created by Razan Raid on 15/10/2023.
//

import Foundation

class DropCounter: ObservableObject {
    @Published var dropCount: Int = 0
    func minus (_ waterintake : Int){
        dropCount -= waterintake
    }
}
