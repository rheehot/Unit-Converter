//
//  main.swift
//  Unit-Converter
//
//  Created by Cory Kim on 2020/01/01.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

extension String {
    mutating func removeSuffix(length: Int) {
        let suffixRange = self.index(self.endIndex, offsetBy: -length) ..< self.index(self.endIndex, offsetBy: 0)
        self.removeSubrange(suffixRange)
    }
}

class Converter {
    
    let centimeterStr = "cm"
    let meterStr = "m"
    let inchStr = "inch"
    
    init() {
        startConverter()
    }
    
    func cmToM(_ centimeter: Double) -> Double {
        return Double(centimeter) / 100
    }
    
    func mToCm(_ meter: Double) -> Double {
        return meter * 100
    }
    
    func inchToCm(_ inch: Double) -> Double {
        return inch * 2.54
    }
    
    func cmToInch(_ centimeter: Double) -> Double {
        return centimeter / 2.54
    }
    
    func convertByInput(_ input: String) {
        var input = input
        if input.hasSuffix(centimeterStr) {
            input.removeSuffix(length: 2)
            guard let value = Double(input) else { return }
            print("\(cmToM(value))m")
        } else if input.hasSuffix(meterStr) {
            input.removeSuffix(length: 1)
            guard let value = Double(input) else { return }
            print("\(mToCm(value))cm")
        } else if input.hasSuffix(inchStr) {
            input.removeSuffix(length: 4)
            guard let value = Double(input) else { return }
            print("\(inchToCm(value))cm")
        }
    }
    
    func startConverter() {
        var input = "sda"
        let inputs = readLine()!.split(separator: " ")
        
        if inputs.count > 1 {
            // split to two
            
            return
        }
        
        convertByInput(input)
    }
}

_ = Converter()
