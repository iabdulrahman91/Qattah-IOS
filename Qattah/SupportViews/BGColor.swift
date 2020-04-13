//
//  BGColor.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/28/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct BGColor: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [Color.clear, self.userData.theme]), startPoint: .topLeading, endPoint: .bottomTrailing)
        self.userData.theme
    }
}

struct BGColorG: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct BGColorR: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(.systemPink), Color(.systemOrange)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct BGColor_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BGColor().environmentObject(UserData())
            BGColorG()
            BGColorR()
            
        }
    }
}
