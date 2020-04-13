//
//  MemberView.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/1/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct MemebersView: View {
    @Binding var profiles: [Profile]
    @Binding var admin: Profile
    @Binding var selectedProfile: Profile?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack (alignment: .center){
                
                ForEach(profiles) { profile in
                    ZStack (alignment: .bottomTrailing) {
                        MultipleSelectionProfile(profile: profile, isSelected: self.selectedProfile == profile){
                            
                            if self.selectedProfile == profile {
                                
                                self.selectedProfile = nil
                            }
                            else {
                                self.selectedProfile = profile
                            }
                        }
                        if profile == self.admin {
                            
                            Image("admin").resizable().frame(width: 20, height: 20).offset(x: 0, y: -15)
                            
                        }
                    }
                    
                }.padding()
                
            }.frame(minWidth: 0, maxWidth: .infinity)
            
        }
    }
}
struct MultipleSelectionProfile: View {
    var profile: Profile
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            
            VStack {
                Image("profile-\(profile.gender)").resizable().frame(width: 50, height: 50, alignment: .center)
                Text(profile.userName).font(.caption)
                
            }.scaleEffect(self.isSelected ? 1.2 : 1)
            
        }.foregroundColor(self.isSelected ? .white : .primary)
    }
}
