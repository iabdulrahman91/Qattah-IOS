//
//  NewEvent.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/26/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct NewEvent: View {
    
    @State var newEvent : Event
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    
    
    
    func addEvent() -> Void {
        userData.events.append(newEvent)
        self.presentationMode.wrappedValue.dismiss()
        
    }
    
    var SaveButton: some View {
        Button(action: { self.addEvent() }) {
            Text("Create")
        }
    }
    
    
    var body: some View {
        
        VStack {
            HStack (alignment: .center) {
                Image(newEvent.type).resizable().frame(width: 100, height: 100)
                VStack {
                    TextField("Event Name", text: $newEvent.name).font(.title)
                }
            }.padding()
            
            
            
            
            NewMemberRow(event: self.$newEvent)
            
            
//            Button(action: {
//                self.addEvent()
//            }){
//                Text("Create").padding().padding(.horizontal, 50)
//                    .overlay(Capsule().stroke(lineWidth: 1))
//            }.padding().disabled(newEvent.name.isEmpty)
//            
            
            Spacer()
        }.navigationBarItems(trailing: SaveButton.disabled(newEvent.name.isEmpty))
            .navigationBarTitle(newEvent.name.isEmpty ? "New Event" : newEvent.name)
        
    }
}
struct NewEvent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NewEvent(newEvent: Event(name: "", admin: Profile.default)).environmentObject(UserData())
        }
    }
}

struct NewMemberRow: View {
    @Binding var event: Event
    
    var memberExcludeAdmin : [Profile]{
        self.event.members.filter { (p) -> Bool in
            p != self.event.admin
        }
    }
    
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack (alignment: .center){
                ForEach(event.members) { profile in
                    ZStack (alignment: .bottomTrailing) {
                        MultipleSelectionProfile(profile: profile, isSelected: false){
                            if profile != self.event.admin {
                                if let i = self.event.members.firstIndex(of: profile){
                                    self.event.members.remove(at: i)
                                }
                            }
                        }
                        
                        Image(profile == self.event.admin ? "admin" : "cancel").resizable().frame(width: 20, height: 20).offset(x: 0, y: -15)
                        
                    }
                    
                }.padding()
                NavigationLink(destination: AddMember(event: self.$event)){
                    Image("addUser2").resizable().frame(width: 60, height: 60)
                }
                
            }.frame(minWidth: 0, maxWidth: .infinity)
        }
        
        
    }
}
