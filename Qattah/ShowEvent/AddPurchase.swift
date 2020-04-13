//
//  AddPurchase.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/1/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct AddPurchase: View {
    @Binding var event: Event
    @State private var newPayment: [Purchase] = []
    var paidBy:Profile
    
    
    func mergePayments() -> Void {
        self.event.payments.append(contentsOf: self.newPayment)
    }
    
    func delete(at offsets: IndexSet) {
        newPayment.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            Text("Paid by \(self.paidBy.userName)").foregroundColor(.secondary).padding(.horizontal)
            NewPurchaseCell(newPayments: self.$newPayment, paidBy: self.paidBy).padding(8)
            
            List{
                ForEach(self.newPayment) { p in
                    HStack {
                        Text(p.itemName)
                        Spacer()
                        Text("SAR \(p.cost.description)")
                    }
                    
                }.onDelete(perform: self.delete)
            }
      
        }.onDisappear(){
            self.mergePayments()
        }
    }
}

struct AddPurchase_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddPurchase(event: .constant(Event.event1), paidBy: Event.event1.members[0])
        }
    }
}
