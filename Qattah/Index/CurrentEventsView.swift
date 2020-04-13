//
//  CurrentEventsView.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/5/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct CurrentEventsView: View {
    @Binding var activeEvents : [Event]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 40){
                ForEach(activeEvents){ event in
                    GeometryReader { geo in
                        NavigationLink(destination: EventDetail(event: event)) {
                            CardView(eventTitle: event.name, eventIcon: event.type, eventTotal: event.totalPayments.description).frame(width: geo.size.width, height: geo.size.height)
                            .rotation3DEffect(Angle(degrees:
                               (Double(geo.frame(in: .global).minX) - 40) / 30
                        ), axis: (x: 0, y: 10, z: 0))
                        }.buttonStyle(PlainButtonStyle())
                        
                        
                    }.frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height / 3.5)
                }
            }.padding(.horizontal, 50).padding(.vertical, 10)
        }
    }
}

struct CurrentEventsView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentEventsView(activeEvents: .constant(Event.events))
    }
}
