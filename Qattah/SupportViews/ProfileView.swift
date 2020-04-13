//
//  ProfileView.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/7/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: self.$userData.theme, label: Text("Theme Color")){
                    ForEach(MyThemeColors.themeColors2, id: \.self) { color in
                        LinearGradient(gradient: Gradient(colors: [Color.clear, color]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView().environmentObject(UserData())
        }
    }
}

