//
//  PhoneNumberFind.swift
//  
//
//  Created by C8V7P2 on 25/11/24.
//

import Foundation

public struct PhoneNumberFind {
    
    public static func run(){
        
        let names = ["Viswa", "Raveena", "Dharma"]
        let phoneNumbers = ["9700800360", "8729919119", "192918399"]
        
        let result = PhoneNumberFind().findContact(names: names, phoneNumbers: phoneNumbers, search: "291")
        print(result)
    }
    
    func findContact(names: [String], phoneNumbers: [String], search: String) -> String {
        var results = [String]()
        
        for index in 0..<names.count {
            if phoneNumbers[index].contains(search) {
                let name = names[index]
                let phoneNumber = phoneNumbers[index]
                results.append("\(name) - \(phoneNumber)")
            }
        }
        
        
        if results.isEmpty {
            return "No contact found"
        }
        
        return results.first ?? "No contact found"
    }
}
