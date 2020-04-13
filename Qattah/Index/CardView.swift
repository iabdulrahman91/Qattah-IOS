//
//  CardView.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/5/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var userData: UserData
    var eventTitle: String = "Title"
    var eventIcon: String = "trip"
    var eventTotal: String = "0.0"
    
    var body: some View {
        VStack(alignment: .center) {
            Text(self.eventTitle).font(.title)
            Image(self.eventIcon)
            Divider()
            Text("SAR \(self.eventTotal)").font(.subheadline)
            }.padding().frame(minWidth: 0, maxWidth: .infinity).clipShape(Rectangle()).background(BGColor()).cornerRadius(15)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView().environmentObject(UserData())
        }
    }
}
