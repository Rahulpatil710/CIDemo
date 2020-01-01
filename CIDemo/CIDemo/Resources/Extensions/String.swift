//
//  String.swift
//  CIDemo
//
//  Created by Rahul Sharma on 29/12/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import Foundation

//let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
//let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
//let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,8}"
//let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)

extension String {
    
    /// Check string is valid email or not
    public func isValidEmail() -> Bool {
        let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,8}"
        let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)
        return __emailPredicate.evaluate(with: self)
    }
    
    /// Check string is valid strong password or not
    public func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{7,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}
