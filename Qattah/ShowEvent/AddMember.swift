//
//  AddMember.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/1/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct AddMember: View {
    @Binding var event:Event
    @State var newMembers : [Profile] = []
    
    
    
    
    private var save: some View {
        Button(action: {
            self.event.members.append(contentsOf: self.newMembers)
            self.newMembers.removeAll()
        }) {
            Text("Add")
        }
    }
    
    
    var body: some View {
        List(Profile.profiles.filter({ (p) -> Bool in
            !event.members.contains(p)
        }).sorted()){ member in
            MultipleSelectionRow(profile: member, isSelected: self.newMembers.contains(member)) {
                if self.newMembers.contains(member) {
                    self.newMembers.removeAll(where: { $0 == member })
                }
                else {
                    self.newMembers.append(member)
                }
            }
        }.navigationBarTitle(Text("Add Member")).navigationBarItems(trailing: save).onDisappear(){
            self.event.members.append(contentsOf: self.newMembers)
            self.newMembers.removeAll()
        }
    }
}

struct AddMember_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddMember(event: .constant(Event.event1))
        }
    }
}

struct MultipleSelectionRow: View {
    var profile: Profile
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Image("profile-\(self.profile.gender)").resizable().frame(width: 30, height: 30, alignment: .center)
                Text(self.profile.userName)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
