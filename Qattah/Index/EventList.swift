//
//  EventList.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/27/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct EventList: View {
    @EnvironmentObject private var userData: UserData
    
    func delete(at offsets: IndexSet) {
        userData.events.remove(atOffsets: offsets)
    }
 
    
    var body: some View {
        List {
            Section(header: Text("All events")){
                ForEach(userData.events) { event in
                    NavigationLink(destination: EventDetail(event: event).environmentObject(self.userData)){
                        HStack{
                            Image(event.type ).resizable().frame(width: 50.0, height: 50.0).cornerRadius(5)
                            Text(event.name)
                            Spacer()
                            Text(event.totalPayments.description).foregroundColor(.gray)
                        }
                    }
                }.onDelete(perform: delete)
            }
            
        }.navigationBarItems(trailing: EditButton())
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {

        NavigationView {
            EventList().environmentObject(UserData())
        }
    }
}
