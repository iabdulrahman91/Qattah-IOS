//
//  NewEventRow.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/12/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct NewEventRow: View {
    @EnvironmentObject var userData: UserData
    @State private var expanded = false
    
    var hasCurrent : Bool {
        !self.userData.events.isEmpty
    }
    var body: some View {
        VStack(spacing: 0){
            // MARK: BTN Toggle New Events Row & NEW Sentance
            if self.hasCurrent {
                HStack {
                    if self.expanded{
                        Text("Type of new event").font(.caption)
                    }
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.expanded.toggle()
                        }
                    }){
                        Image(systemName: "plus").font(.largeTitle)
                            .rotationEffect(.degrees(self.expanded ? 45 : 0))
                            .foregroundColor(self.expanded ? Color(.systemRed) : nil)
                        
                    }.buttonStyle(PlainButtonStyle())
                }.padding()
            } else {
                Text("Create you first Event").font(.subheadline).padding()
            }
            
            // MARK: New Events Row
            if self.expanded || !self.hasCurrent {
                TypesRow()
                
            }
        }.background(self.expanded ? BGColor() : nil).cornerRadius(15).padding(.vertical,10)
    }
}

struct NewEventRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NewEventRow().environmentObject(UserData())

        }
    }
}
