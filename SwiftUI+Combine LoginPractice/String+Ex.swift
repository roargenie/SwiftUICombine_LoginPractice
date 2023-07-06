//
//  String+Ex.swift
//  SwiftUI+Combine LoginPractice
//
//  Created by 이명진 on 2023/07/06.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: self)
        return isValid
    }
}
