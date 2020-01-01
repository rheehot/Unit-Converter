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
    
    init() {
        startConverter()
    }
    
    func toMeter(_ value: Int) -> Double {
        return Double(value) / 100
    }
    
    func toCentimeter(_ value: Double) -> Int {
        return Int(value * 100)
    }
    
    func startConverter() {
        let input = readLine()!
        var valueString = input

        if input.hasSuffix(centimeterStr) {
            valueString.removeSuffix(length: 2)
            guard let value = Int(valueString) else { return }
            print("\(toMeter(value))m")
        } else if input.hasSuffix(meterStr) {
            valueString.removeSuffix(length: 1)
            guard let value = Double(valueString) else { return }
            print("\(toCentimeter(value))cm")
        }
    }
}

_ = Converter()
