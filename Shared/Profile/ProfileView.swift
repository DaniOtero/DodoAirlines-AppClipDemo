//
//  ProfileView.swift
//  DodoAirlines (iOS)
//
//  Created by Daniel Otero on 10/07/2020.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    
    private var colorForUserLevel: Color {
        switch user.level {
        case .bronze:
            return .orange
        case .silver:
            return .gray
        case .gold:
            return .yellow
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                VStack {
                    Text("\(user.name) \(user.surname)")
                        .font(.title)
                    Text("Level")
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundColor(colorForUserLevel)
                    Text("You have \(user.NookMiles) Nook miles!")
                }
                .frame(maxWidth: .infinity)
                .padding(.all, 16)
                .background(Color("Box"))
                .cornerRadius(16.0)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.all, 16)
            .background(Color("Background").edgesIgnoringSafeArea(.all))
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(name: "Tom", surname: "Nook", NookMiles: 100000, level: .gold))
    }
}
