//
//  UpdateEmailViewViewModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 21.10.2023.
//

import Foundation
final class UpdateEmailViewViewModel : ObservableObject{
    @Published var email : String = ""
    
    func updateEmail() async throws{
        try await AuthManager.shared.recoverPassword(email: email)
    }
}
