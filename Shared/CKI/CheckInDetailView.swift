//
//  CheckInDetailViedw.swift
//  DodoAirlines
//
//  Created by Daniel Otero on 08/07/2020.
//

import SwiftUI

struct CheckInDetailView: View {
    var flight: Flight
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                HStack(spacing: 16) {
                    Spacer()
                    Text(flight.origin)
                        .font(.title)
                        .bold()
                    Image(systemName: "airplane")
                        .resizable()
                        .frame(width: 44, height: 44)
                    Text(flight.dest)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                Text(flight.date...flight.date.addingTimeInterval(flight.duration))
                HStack {
                    CustomButton(action: getBoardingCard) {
                        Text("Boarding card")
                    }
                    CustomButton(action: buyExtras) {
                        Text("Buy extras")
                    }
                }
            }
            .padding(.all, 16)
            .background(Color("Box"))
            .cornerRadius(16.0)
            Spacer()
        }
        .padding(.all, 16)
        .background(Color("Background").edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Detail")
        .colorScheme(.light)
    }
    
    func getBoardingCard() {
    }
    
    func buyExtras() {
    }
}

struct CheckInDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInDetailView(flight: Flight(origin: "MAD",
                                         dest: "NRT",
                                         date: Date(),
                                         checked: false,
                                         duration: 3600 * 14))
    }
}
