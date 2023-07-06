//
//  UnderLineTextField.swift
//  SwiftUI+Combine LoginPractice
//
//  Created by 이명진 on 2023/07/06.
//

import SwiftUI

struct UnderLineTextField: TextFieldStyle {
    @Binding var isEditing: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack {
            configuration
                .padding(.horizontal, 8)
            
            Rectangle()
                .foregroundColor(isEditing ? .white : .gray)
                .frame(height: 1)
        }
    }
}
