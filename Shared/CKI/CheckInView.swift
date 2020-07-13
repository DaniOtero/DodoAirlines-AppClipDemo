//
//  CheckInView.swift
//  DodoAirlines
//
//  Created by Daniel Otero on 08/07/2020.
//

import SwiftUI

#if APPCLIP
import StoreKit
#endif

struct CheckInView: View {
    @State private var surname: String = ""
    @State private var locator: String = ""
    @State private var keyboardOffset: CGFloat = 0
    @State private var showDetail: Bool = false
    
    #if APPCLIP
    @State private var showCheckInSuccess: Bool = false
    @State private var presentingAppStoreOverlay: Bool = false
    #endif
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                #if APPCLIP
                container(geometry: geometry)
                    .appStoreOverlay(isPresented: $presentingAppStoreOverlay) {
                        SKOverlay.AppClipConfiguration(position: .bottom)
                    }
                #else
                container(geometry: geometry)
                #endif
            }
            .colorScheme(.light)
        }
        .accentColor(.white)
        .colorScheme(.dark)
    }
    
    private func container(geometry: GeometryProxy) -> some View {
        VStack {
            Image("logo")
            VStack(spacing: 8) {
                VStack {
                    TextField("Surname", text: $surname)
                        .padding(.all, 8)
                    TextField("Locator", text: $locator)
                        .padding(.all, 8)
                }
                .background(Color.white)
                .cornerRadius(8)
                #if APPCLIP
                CustomButton(action: checkIn) {
                    Text("Check In")
                }
                .alert(isPresented: $showCheckInSuccess) {
                    Alert(title: Text("Success"),
                          message: Text("Your flight is checked in. If this was a real App this should download your boarding passes 🙂"))
                    
                }
                #else
                NavigationLink(
                    destination: checkinDetailView,
                    isActive: $showDetail,
                    label: {
                        CustomButton(action: checkIn) {
                            Text("Check In")
                        }
                    })
                #endif

                
                
            }
            .padding(.all, 16)
            .background(Color("Box"))
            .cornerRadius(16.0)
            Spacer()
        }
        .frame(height: geometry.size.height - keyboardOffset)
        .animation(.spring())
        .padding(.all, 16)
        .background(Color("Background").edgesIgnoringSafeArea(.all))
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                let rect = notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! CGRect
                self.keyboardOffset = rect.height
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                self.keyboardOffset = 0
            }
        }
    }
    
    private func checkIn() {
        #if APPCLIP
        showCheckInSuccess.toggle()
        presentingAppStoreOverlay.toggle()
        #else
        showDetail.toggle()
        #endif
    }
    
    #if !APPCLIP
    var checkinDetailView: some View {
        let flight = Flight(origin: "MAD",
                            dest: "NRT",
                            date: Date(),
                            checked: false,
                            duration: 3600 * 14)
        return CheckInDetailView(flight: flight)
    }
    #endif
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}
