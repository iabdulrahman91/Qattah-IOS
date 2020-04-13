//
//  AddPurchase.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/31/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct NewPurchaseCell: View {
    @State private var itemName: String = ""
    @State private var amount: Decimal?
    @Binding var newPayments: [Purchase]
    var paidBy: Profile
    
    
    var costDouble : Double {
        var cost : Double = 0.0
        if let a = self.amount {
            cost = Double(truncating: NSDecimalNumber(decimal: a ))
        }
        return cost
    }
    
    func addPurchase() {
        
        
        self.newPayments.append(Purchase(paidBy: self.paidBy, itemName: self.itemName, cost: costDouble, type : Purchase.Types.purchase.rawValue))
        self.itemName = ""
        self.amount = nil
    }
    

    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 16){
                TextField("Item Name", text: self.$itemName)
                FormattedTextField(
                    "Enter amount",
                    value: $amount,
                    formatter: CurrencyTextFieldFormatter()
                ).keyboardType(.decimalPad)
            }.padding().background(Color(.systemGray5)).cornerRadius(5).padding(.bottom)
            
            Button(action: {
                self.addPurchase()
                UIApplication.shared.endEditing()
                
            }){
                Image(systemName: "plus.circle.fill").resizable().frame(width: 35, height: 35, alignment: .center)
            }.disabled((self.itemName.isEmpty) || self.costDouble.isLessThanOrEqualTo(0.0)).padding(.horizontal)
            
        }.shadow(radius: 10)
    }
}


// extension for keyboard to dismiss
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}




struct NewPurchaseCell_Previews: PreviewProvider {
    static var previews: some View {
        NewPurchaseCell(newPayments: .constant(Event.event1.payments), paidBy: Profile.profile1)
    }
}

struct CurrencyTextFieldFormatter: TextFieldFormatter {
    typealias Value = Decimal?
    
    func displayString(for value: Decimal?) -> String {
        guard let value = value else { return "" }
        return NumberFormatter.currency.string(for: value) ?? ""
    }
    
    func editingString(for value: Decimal?) -> String {
        guard let value = value else { return "" }
        return NumberFormatter.currencyEditing.string(for: value) ?? ""
    }
    
    func value(from string: String) -> Decimal? {
        let formatter = NumberFormatter.currencyEditing
        let value = formatter.number(from: string)?.decimalValue
        let formattedString = value.map { formatter.string(for: $0) } as? String
        return formattedString.map { formatter.number(from: $0)?.decimalValue } as? Decimal
    }
}

extension NumberFormatter {
    static let currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    static let currencyEditing: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ""
        formatter.minimumFractionDigits = NumberFormatter.currency.minimumFractionDigits
        formatter.maximumFractionDigits = NumberFormatter.currency.maximumFractionDigits
        return formatter
    }()
}
