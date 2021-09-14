//
//  Usermanager.swift
//  HW_3.3
//
//  Created by Maxim Mitin on 14.09.21.
//

import SwiftUI
import Foundation

class UserManager: ObservableObject {
    @AppStorage("Registred") var registred = false
    @AppStorage("logedUser") var logedUser = ""
}
