//
//  Profile.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/26/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct Profile : Hashable, Identifiable, Comparable{
    static func < (lhs: Profile, rhs: Profile) -> Bool {
        lhs.userName < rhs.userName
    }
    
    var id = UUID()
    var userName: String
    var gender: Gender
    var image: String?
    var createdAt : Date = Date()
    
    static let `default` = Self(userName: "Abdulrahman",  gender: .male)
    static let profile1 = Profile(userName: "Nader", gender: .male)
    static let profile2 = Profile(userName: "Ibrahim",  gender: .male)
    static let profile3 = Profile(userName: "Khaled",  gender: .male)
    static let profile4 = Profile(userName: "Rawan", gender: .female)
    
    static let profiles = [profile1,profile2,profile3,profile4]
    
    enum Gender: String, CaseIterable {
        case male = "👨🏻‍🦱"
        case female = "👩🏻"
    }
}

//extension Profile {
//    var image: Image {
//        ImageStore.shared.image(name: imageName)
//    }
//}
