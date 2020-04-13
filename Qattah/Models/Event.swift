//
//  Event.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/18/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import Foundation

struct Event : Hashable, Identifiable {
    
    var id = UUID()
    var name : String
    var type : String
    var admin : Profile
    var members : [Profile] = []
    var payments: [Purchase] = []
    var createdAt: Date
    var closedAt: Date?
    
    var groupedPayment: [Profile: [Purchase]] {
        Dictionary(grouping: payments, by: {$0.paidBy})
    }
    
    var totalPayments : Double {
        payments.map({ (p) -> Double in
            p.cost
        }).reduce(0.0, +)
    }
    
    var perPerson : Double {
        totalPayments/Double(self.members.count)
    }
    
    var totalGrouped : [Profile:Double] {
        groupedPayment.mapValues({ (payments) -> Double in
            payments.map ({ (p) -> Double in
                p.cost
            }).reduce(0, +)
        })
    }
    
    
    
    
    init(name: String, type: String = "unknown", admin: Profile, payments: [Purchase] = []) {
        self.name = name
        self.type = type
        self.admin = admin
        self.payments = payments
        self.members.append(admin)
        self.createdAt = Date()
    }
    
    
    
    
    
    static let event2 = Self(name: "Jubail", admin: Profile.profile1)
    
    static let event1 =  Self(name: "Dammam", admin: Profile.default)
    
    
    
    
    static let events : [Event] = [
        Self(name: "Fanateer", type: "beach", admin: Profile.profile2, payments: Purchase.p1s),
        
        Self(name: "Dammam", type: "trip", admin: Profile.profile3),
        
    ]
    
    
}
