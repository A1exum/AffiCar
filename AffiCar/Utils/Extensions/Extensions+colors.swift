//
//  Extensions.swift
//  AffiCar
//
//  Created by Alex Fount on 29.08.22.
//

import SwiftUI

extension Color {
    
    static let mainBackground = LinearGradient(
        gradient: Gradient(stops: [
    .init(color: Color(#colorLiteral(red: 0.5725490451, green: 0.6156862974, blue: 0.7058823705, alpha: 1)), location: 0),
    .init(color: Color(#colorLiteral(red: 0.7803921699523926, green: 0.8117647171020508, blue: 0.8588235378265381, alpha: 1)), location: 0.40),
    .init(color: Color(#colorLiteral(red: 0.9607843160629272, green: 0.9686274528503418, blue: 0.9882352948188782, alpha: 1)), location: 0.96)]),
        startPoint: UnitPoint(x: 0.3, y: 0),
        endPoint: UnitPoint(x: 0.6, y: 1))
    
    
}
