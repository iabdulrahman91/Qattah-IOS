//
//  AddMoney.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/1/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct AddMoney: View {
    var type = ["Sent", "Received"]
    @Binding var event : Event
    @State private var selectedType = "Sent"
    @State private var selectedProfile : Profile?
    @State private var amount: Decimal?

    var profilesToSelect : [Profile] {
        event.members.filter { (p) -> Bool in
            p != Profile.default
        }
    }
    var body: some View {
        Form{
            
            Section{
                Picker("Transaction Type", selection: self.$selectedType){
                    ForEach(self.type, id: \.self){
                        Text($0).tag($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section{
                Picker(selection: self.$selectedProfile, label: Text(self.selectedType == "Sent" ? "To" : "From")){
                    ForEach(self.profilesToSelect){ profile in
                        Text(profile.userName).tag(profile)
                    }
                }.pickerStyle(DefaultPickerStyle())
            }
            
            Section{
                FormattedTextField(
                    "Enter amount",
                    value: $amount,
                    formatter: CurrencyTextFieldFormatter()
                ).keyboardType(.decimalPad)
                Button(action: {
                    //
                }){
                    Text("Add Payment")
                }
            }.disabled(self.selectedProfile==nil)
            
            
        }
    }
}

struct AddMoney_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddMoney(event: .constant(Event.event1))
        }
    }
}
