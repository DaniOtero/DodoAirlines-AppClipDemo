//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Otero on 08/07/2020.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BookingView(cities: demoCities)
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Find")
                }
                .tag(1)
                .background(Color("Background").edgesIgnoringSafeArea(.all))
            CheckInView()
                .tabItem {
                    Image(systemName: "wallet.pass")
                    Text("Check In")
                }
                .tag(2)
                .background(Color("Background").edgesIgnoringSafeArea(.all))
            ProfileView(user: demoUser)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
                .background(Color("Background").edgesIgnoringSafeArea(.all))
        }
    }
}

extension MainView {
    var demoCities: [String] {
        ["Madrid", "Tokyo", "New york"]
    }
    
    var demoUser: User {
        User(name: "Tom", surname: "Nook", NookMiles: 100000, level: .gold)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
