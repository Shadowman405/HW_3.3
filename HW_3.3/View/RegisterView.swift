//
//  RegisterView.swift
//  HW_3.3
//
//  Created by Maxim Mitin on 14.09.21.
//

import SwiftUI

struct RegisterView: View {
    @AppStorage(wrappedValue: "", "logedUser") var logedUser
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    @State private var colorCheck = Color.red
    @State private var buttonCheck = true
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter yor name", text: Binding(get: {
                    self.name
                }, set: { newValue in
                    self.name = newValue
                    if self.name.count < 3 {
                        colorCheck = Color.red
                        buttonCheck = true
                    } else {
                        colorCheck = Color.green
                        buttonCheck = false
                    }
                }))
                    .multilineTextAlignment(.center)
                
                Text("\(name.count)")
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
        if !name.isEmpty {
            user.name = name
            logedUser = user.name
            user.isRegister.toggle()
            print("\(logedUser)")
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
