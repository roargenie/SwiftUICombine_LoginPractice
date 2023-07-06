//
//  LoginView.swift
//  SwiftUI+Combine LoginPractice
//
//  Created by 이명진 on 2023/07/06.
//

import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    
    @State var emailTextFieldisEditing: Bool = false
    @State var passwordTextFieldisEditing: Bool = false
    
    var body: some View {
        VStack {
            TextField("이메일을 입력하세요", text: $viewModel.emailText, onEditingChanged: { editing in
                emailTextFieldisEditing = editing
            })
                .textFieldStyle(UnderLineTextField(isEditing: $emailTextFieldisEditing))
                .frame(height: 50)
            
            TextField("비밀번호를 입력하세요", text: $viewModel.passwordText, onEditingChanged: { editing in
                passwordTextFieldisEditing = editing
            })
                .textFieldStyle(UnderLineTextField(isEditing: $passwordTextFieldisEditing))
                .frame(height: 50)
            
            Button {
                //
                print("버튼 클릭 됨")
            } label: {
                Text("Login")
                    .font(.title3)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(viewModel.isValid ? Color.red : Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .disabled(!viewModel.isValid)

        }
        .padding(.horizontal, 16)
        .preferredColorScheme(.dark)
        
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
