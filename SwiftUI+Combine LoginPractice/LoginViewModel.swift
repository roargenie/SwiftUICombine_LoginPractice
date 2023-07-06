//
//  LoginViewModel.swift
//  SwiftUI+Combine LoginPractice
//
//  Created by 이명진 on 2023/07/06.
//

import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var isValid: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupValidation()
    }
    
    private func setupValidation() {
        Publishers.CombineLatest($emailText, $passwordText)
            .map { email, password in
                return email.isValidEmail() && password.count > 8
            }
            .receive(on: DispatchQueue.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellables)
    }
    
}
