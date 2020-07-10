//
//  CheckInView.swift
//  DodoAirlines
//
//  Created by Daniel Otero on 08/07/2020.
//

import SwiftUI

struct CheckInView: View {
    @State private var surname: String = ""
    @State private var locator: String = ""
    @State private var keyboardOffset: CGFloat = 0
    @State private var showDetail: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
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
                        NavigationLink(
                            destination: checkinDetailView(),
                            isActive: $showDetail,
                            label: {
                                CustomButton(action: checkIn) {
                                    Text("Check In")
                                }
                            })
                        
                        
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
            .colorScheme(.light)
        }
        .accentColor(.white)
        .colorScheme(.dark)

    }
    
    private func checkIn() {
        showDetail.toggle()
    }
    
    private func checkinDetailView() -> some View {
        let flight = Flight(origin: "MAD",
                            dest: "NRT",
                            date: Date(),
                            checked: false,
                            duration: 3600 * 14)
        return CheckInDetailView(flight: flight)
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}
