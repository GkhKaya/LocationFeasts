//
//  SettingsViewViewModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 20.10.2023.
//

import Foundation

@MainActor
final class SettingsViewViewModel : ObservableObject{
    @Published var darkModeToggle : Bool  = true
    
    
    func signOut() async throws{
        try AuthManager.shared.signOut()
    }
    
}
