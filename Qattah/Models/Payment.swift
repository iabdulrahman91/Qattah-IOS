//
//  Payment.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/13/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import Foundation

struct Payment: Hashable, Identifiable {
    var id = UUID()
    var paidBy : Profile
    var paidTo : Profile
    var amount : Double
}
