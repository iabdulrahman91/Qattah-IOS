//
//  EventView.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/18/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

struct EventDetail: View {
    @EnvironmentObject var userData : UserData
    var event : Event
    @State var selectedProfile : Profile?
    @State var showingDelete = false
    
    var h : CGFloat = UIScreen.main.bounds.height * 0.7 // take half
    
    var eventIndex: Int {
        userData.events.firstIndex(where: { $0.id == event.id })!
    }
    
    
    
    func delete(payment: Purchase) {
        if let paymentIndex = self.userData.events[eventIndex].payments.firstIndex(of: payment){
            self.userData.events[eventIndex].payments.remove(at: paymentIndex)
        }
        
        
    }
    
    
    
    var addButton: some View {
        NavigationLink(destination: AddMember(event: self.$userData.events[eventIndex])) {
            Image("addUser2").resizable().frame(width: 30, height: 30, alignment: .center).padding(8)
                .shadow(radius: 5)
        }.foregroundColor(.primary)
    }
    
    
    
    var body: some View {
   
            
            ScrollView(.vertical, showsIndicators: false){
                
                
                VStack (alignment: .leading) {
                    HStack(alignment: .bottom) {
                        MemebersView(profiles: self.$userData.events[eventIndex].members, admin: self.$userData.events[eventIndex].admin, selectedProfile: self.$selectedProfile).padding(.top, h * 0.75)
                    }
                    
                }.frame(height: self.h).background(BGColor().cornerRadius(15)).offset(x: 0, y: (h * -0.8)).padding(.bottom, (h * -0.79))
                
                
                
                ActionsRow(event: self.$userData.events[eventIndex], selectedProfile: self.$selectedProfile).environmentObject(self.userData)
                
                PurchasesList(event: self.$userData.events[eventIndex], selectedProfile: self.$selectedProfile)
                
            }
            .navigationBarTitle(Text(event.name))
            .navigationBarItems(trailing: addButton)
        
    }
}


struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
                EventDetail(event: Event.events[0])
            }.environment(\.colorScheme, .light)
            NavigationView{
                EventDetail(event: Event.events[0])
            }.environment(\.colorScheme, .dark)
        }.environmentObject(UserData())
            .previewDevice("iPhone 11 Pro")
        
    }
}





struct PurchasesList: View {
    @Binding var event: Event
    @Binding var selectedProfile : Profile?
    
    
    var shownPayments : [Purchase] {
        guard let profile = self.selectedProfile else {return self.event.payments}
        
        return self.event.payments.filter { (p) -> Bool in
            p.paidBy == profile
        }
    }
    
    var selectedTotal : Double {
        var total = 0.0
        for p in self.shownPayments {
            total += p.cost
        }
        return total
    }
    
    
    var body: some View {
        Group{
            VStack{
                Group{
                    if !self.shownPayments.isEmpty {
                        ForEach(self.shownPayments){ payment in
                            HStack {
                                Text(payment.itemName)
                                Spacer()
                                Text(payment.cost.description)
                            }
                        }
                        
                        HStack {
                            Text("Total").font(.headline)
                            Spacer()
                            Text(selectedTotal.description)
                        }.padding()
                            .clipShape(Rectangle())
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                        
                    } else {
                        Text("No Payment is made yet ~\\*_*/~")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                }.padding(10)
            }.background(Color(.systemGray5))
                .cornerRadius(5).shadow(radius: 1)
        }.padding(10)
    }
}

struct ActionsRow: View {
    @EnvironmentObject var userData : UserData
    @Binding var event: Event
    @Binding var selectedProfile: Profile?
    
    var paidByProfile: Profile {
        self.selectedProfile == nil ? userData.profile : selectedProfile!
    }
    var remain : Double {
        let l = self.event.totalGrouped[paidByProfile] ?? 0.0
        let r = self.event.perPerson
        return l-r
    }
    
    
    var body: some View {
        
        
        HStack (alignment: .center, spacing: 18){
            Spacer()
            NavigationLink(destination: AddMoney(event: self.$event)) {
                if self.remain.isLess(than: 0){
                    Text("\(self.remain.description)")
                        .frame(minWidth: 0, maxWidth: 90, alignment: .center)
                        .padding(10)
                        .background(BGColorR())
                        .cornerRadius(5)
                        .foregroundColor(.white)
                } else {
                    Text("+\(self.remain.description)")
                        .frame(minWidth: 0, maxWidth: 90, alignment: .center)
                        .padding(10)
                        .background(BGColorG())
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                
            }.shadow(radius: 3)
            
            NavigationLink(destination: AddPurchase(event: self.$event,
                                                    paidBy: self.paidByProfile)) {
                                                        Image("addTag").resizable().frame(width: 50, height: 50, alignment: .center)
                                                            .foregroundColor(.white)
                                                            .shadow(radius: 5)
                                                        
            }.buttonStyle(PlainButtonStyle())
            
        }.offset(y: -40).padding(.horizontal).padding(.bottom, -40)
        
    }
    
}
