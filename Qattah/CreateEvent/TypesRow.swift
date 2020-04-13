//
//  TypesRow.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/28/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct TypesRow: View {
    @EnvironmentObject private var userData: UserData
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(userData.types, id: \.self) { type in
                    NavigationLink(destination: NewEvent(newEvent: Event(name: "", type: type, admin: Profile.default))){
                        VStack{
                            Image(type).renderingMode(.original)
                            Text(type).font(.caption)
                        }.padding()
                    }.buttonStyle(PlainButtonStyle())
                }
            }
            
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        userData.types.move(fromOffsets: source, toOffset: destination)
    }
}

struct TypesRow_Previews: PreviewProvider {
    static var previews: some View {
        TypesRow().environmentObject(UserData())
    }
}
