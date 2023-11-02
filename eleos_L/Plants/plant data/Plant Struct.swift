//
//  Plant Struct.swift
//  eleos_L
//
//  Created by Razan Raid on 27/08/2023.
//

import Foundation
import SwiftUI

struct Plant: Identifiable {
    var id = UUID()
    var plantName: String
    //pics
    var plantPic: String
    var plantFullPic : String

    //bs
    var plantHeadline: String
    var plantDescription : String
    //water
    var dropsNeeded : Int
    var waterIntake : Int
    //???
    var isMonstera = false
}
