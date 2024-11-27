//
//  PhoneNumberFormat.swift
//  
//
//  Created by C8V7P2 on 25/11/24.
//

import Foundation

public class PhoneNumberFormat {
    
    public static func run() {
        //var phoneNumber = "123     494 202 2032 200"
        //var phoneNumber = "123456789"
        let phoneNumber = "12345678912"
        //var phoneNumber = "1234567891"
        
        let result = PhoneNumberFormat().formatNumber(num: phoneNumber )
        print(result)
        
    }
    
   private func formatNumber(num: String) -> String{
        var inputString = num.replacingOccurrences(of: " ", with: "")
        inputString = inputString.replacingOccurrences(of: "_", with: "")
        var result = ""
         
        var count = -2
        for char in inputString {
            result = result.appending("\(char)")
            if count%3 == 0 {
                result.append("-")
            }
            
            count = count+1
        }
        
        if result.last == "-" {
            result = String(result.dropLast())
        }
        
        var chars = Array(result)
        let secondLastPtr = result.count-2
        if chars[secondLastPtr] == "-" {
            // *-X => -*X
            chars[secondLastPtr] = chars[secondLastPtr-1]
            chars[secondLastPtr-1] = "-"
        }
        
        
        let string = String(chars)
        return string
    }
}
