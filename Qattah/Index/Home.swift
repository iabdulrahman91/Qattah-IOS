//
//  ContentView.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/18/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var userData: UserData
    @State var showingProfile = false
    
    
    var hasCurrent : Bool {
        !self.userData.events.isEmpty
    }
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .font(.title)
                .accessibility(label: Text("New Event"))
        }.buttonStyle(PlainButtonStyle())
    }
    
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                // MARK: Header
                ScrollView(.vertical, showsIndicators: false){
                    BGColor().frame(height: geo.size.height)
                        .cornerRadius(20)
                        .offset(x: 0, y: -geo.size.height * 0.92)
                        .padding(.bottom, -geo.size.height * 0.92)
                    
                    
                    // MARK: New Event Row
                    NewEventRow().environmentObject(self.userData)
                    
                    // MARK: Current Events CARDS Row
                    CurrentEventsView(activeEvents: self.$userData.events)
                    
                    
                    // MARK: All Event List
                    if self.hasCurrent {
                        NavigationLink(destination: EventList()){
                            Text("All Event")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                    }
                    Spacer()
                    
                }.navigationBarTitle(Text("Events"))
                    .navigationBarItems(trailing: self.profileButton)
                    .listStyle(GroupedListStyle())
                    .sheet(isPresented: self.$showingProfile){
                        ProfileView().environmentObject(self.userData)
                        
                }
            }
        } 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home().environment(\.colorScheme, .dark)
            Home().environment(\.colorScheme, .light)
        }.environmentObject(UserData())
            .previewDevice("iPhone 11 Pro")
    }
}









