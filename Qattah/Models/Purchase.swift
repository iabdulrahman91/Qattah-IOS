//
//  Payment.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/18/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import Foundation

struct Purchase: Hashable, Identifiable {
    var id = UUID()
    var paidBy : Profile
    var itemName:String
    var cost:Double
    var type = ""
    
//    static func + (lhs: Payment, rhs: Payment) -> Double {
//        lhs.cost + rhs.cost
//    }
    
    enum Types : String, CaseIterable {
        case member = "👥"
        case purchase = "🛒"
        case money = "💵"
    }
    
    
    // DATA
    
    
    
    
    static let p1 = Purchase(paidBy : Profile.profile1 , itemName: "coffe", cost: 27.0)
    
    static let p1s = [
        Purchase(paidBy: Profile.profile2 , itemName: "coffe", cost: 27.0),
        Purchase(paidBy: Profile.profile1 , itemName: "pepsi", cost: 10.0),
        Purchase(paidBy: Profile.profile2 , itemName: "cookies", cost: 5.0),
        Purchase(paidBy: Profile.profile3 , itemName: "water", cost: 2.0),
    ]
    
    static let p2s = [
        Purchase(paidBy: Profile.profile1 , itemName: "milk", cost: 7.0),
        Purchase(paidBy: Profile.profile1 , itemName: "pepsi", cost: 10.0),
        Purchase(paidBy: Profile.profile2 , itemName: "cookies", cost: 5.0),
        Purchase(paidBy: Profile.profile2 , itemName: "water", cost: 2.0),
    ]
    
    static let p3s = [
        Purchase(paidBy: Profile.profile3 , itemName: "coffe", cost: 27.0),
        Purchase(paidBy: Profile.profile3 , itemName: "pepsi", cost: 10.0),
        Purchase(paidBy: Profile.profile3 , itemName: "cookies", cost: 5.0),
        Purchase(paidBy: Profile.profile3 , itemName: "water", cost: 2.0),
    ]
    
    
}
