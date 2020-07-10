//
//  CustomButton.swift
//  DodoAirlines (iOS)
//
//  Created by Daniel Otero on 09/07/2020.
//

import SwiftUI

struct CustomButton<Label>: View where Label: View {
    typealias Action = () -> Void
    
    var action: Action
    var label: () -> Label
    
    var body: some View {
        Button(action: action, label: label)
        .padding(.all, 16)
        .foregroundColor(.white)
        .background(Color("Button"))
        .cornerRadius(16.0)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(action: {}) {
            Text("Button")
        }
    }
}
