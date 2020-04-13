//
//  UserData.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/26/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

final class UserData: ObservableObject {
    @Published var events : [Event] = Event.events
    @Published var profile = Profile.default
    @Published var types = ["restaurant","trip","coffee","beach","camping","home"]
    @Published var theme : Color = Color(.systemIndigo)
}

