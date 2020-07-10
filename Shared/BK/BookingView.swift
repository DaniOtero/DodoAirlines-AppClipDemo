//
//  BookingView.swift
//  DodoAirlines (iOS)
//
//  Created by Daniel Otero on 10/07/2020.
//

import SwiftUI

struct BookingView: View {
    var cities: [String]
    @State private var selectedOrigin: String = "-"
    @State private var selectedDestination: String = "-"
    @State private var selectedDate: Date = Date()
    
    @State private var showOriginList: Bool = false
    @State private var showDestinationList: Bool = false
    
    @State private var showDatePicker: Bool = false
    
    var originCities: [String] {
        cities.filter { $0 != selectedDestination }
    }

    var destinationCities: [String] {
        cities.filter { $0 != selectedOrigin }
    }
    
    var body: some View {
        NavigationView {
             VStack {
                Image("logo")
                VStack {
                    HStack {
                        NavigationLink(
                            destination:
                                List {
                                    ForEach(originCities, id: \.self) { city in
                                        Text(city)
                                            .onTapGesture {
                                                selectedOrigin = city
                                                showOriginList.toggle()
                                            }
                                    }
                                }
                                .navigationTitle("Origin"),
                            isActive: $showOriginList,
                            label: {
                                VStack {
                                    Text("Origin")
                                        .font(.headline)
                                    Text(selectedOrigin)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.all, 16)
                                .background(Color.white)
                                .cornerRadius(16)
                            })
                            .foregroundColor(.black)
                        
                        NavigationLink(
                            destination:
                                List {
                                    ForEach(destinationCities, id: \.self) { city in
                                        Text(city)
                                            .onTapGesture {
                                                selectedDestination = city
                                                showDestinationList.toggle()
                                            }
                                    }
                                }
                                .navigationTitle("Destination"),
                            isActive: $showDestinationList,
                            label: {
                                VStack {
                                    Text("Destination")
                                        .font(.headline)
                                    Text(selectedDestination)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.all, 16)
                                .background(Color.white)
                                .cornerRadius(16)
                            })
                            .foregroundColor(.black)
                            
                        
                    }
                    VStack {
                        HStack {
                            Image(systemName: "calendar")
                            Text(selectedDate, style: .date)
                        }
                        .onTapGesture {
                            showDatePicker.toggle()
                        }
                        if showDatePicker {
                            HStack {
                                Spacer()
                                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                                    .labelsHidden()
                                    .frame(maxHeight: 44, alignment: .center)
                                Spacer()
                            }
                            
                        }
                    }
                    Spacer()
                        .frame(height: 24)
                    CustomButton(action: {}) {
                        Text("Search flights")
                    }
                }
                .padding(.all, 16)
                .background(Color("Box"))
                .cornerRadius(16.0)
                Spacer()
            }
            .padding(.all, 16)
            .background(Color("Background").edgesIgnoringSafeArea(.all))
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(cities: ["Madrid", "Tokyo", "New york"])
    }
}
