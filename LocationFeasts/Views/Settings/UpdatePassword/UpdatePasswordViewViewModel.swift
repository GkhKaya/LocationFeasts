//
//  UpdatePasswordViewViewModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 22.10.2023.
//

import Foundation

final class UpdatePasswordViewViewModel : ObservableObject{
    @Published var email : String  = ""
    
    func updatePassword() async throws{
        let authedUser = try AuthManager.shared.getAuthenticatedUser()
        guard let email = authedUser.email else{
            throw URLError(.fileDoesNotExist)
        }
        try await AuthManager.shared.recoverPassword(email: email)
    }
    
    
    
}
