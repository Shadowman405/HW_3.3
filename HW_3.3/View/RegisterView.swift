//
//  RegisterView.swift
//  HW_3.3
//
//  Created by Maxim Mitin on 14.09.21.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var colorCheck = Color.red
    @State private var buttonCheck = true
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter yor name", text: Binding(get: {
                    self.user.logedUser
                }, set: { newValue in
                    self.user.logedUser = newValue
                    if self.user.logedUser.count < 3 {
                        colorCheck = Color.red
                        buttonCheck = true
                    } else {
                        colorCheck = Color.green
                        buttonCheck = false
                    }
                }))
                    .multilineTextAlignment(.center)
                
                Text("\(user.logedUser.count)")
                    .offset(x: -30, y: 0)
                    .foregroundColor(colorCheck)
            }
            Button(action: registerUser) {
                HStack{
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(buttonCheck)
        }
    }
    
    private func registerUser() {
        if !user.logedUser.isEmpty {
            user.registred = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
