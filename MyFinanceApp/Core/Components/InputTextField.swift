//
//  InputTextField.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import Foundation
import SwiftUI


struct InputTextField: View {
    let placeholder: String
    @Binding var value: Double?
    @State private var text:String = ""
    
    init(_ placeholder: String, value: Binding<Double?>) {
        self.placeholder = placeholder
        self._value = value
        self.text = text
    }
    
    
    var body: some View {
        TextField(placeholder, text: $text)
            .inputTextField()
            .onAppear{
                if let value {
                    text = formatNumber(value)}
                }.onChange(of:text){
                        _, newText in
                        let cleanedText = cleanInput(newText)
                        value = Double(cleanedText)
                    }
                .onChange(of: value){
                    _, newValue in
                    text = formatNumber(newValue)
                }
            }
    }


//if os (IOS) || os(tvOS)
private extension InputTextField {
    func cleanInput(_ string:String) -> String {
        var result = string.filter {
            "0123456789".contains($0)
        }
        let decimalParts = result.split(separator: ".", maxSplits: 1, omittingEmptySubsequences:false)
        if decimalParts.count > 1 {
            let integerPart = String(decimalParts[0])
            let fractionalPart = String(decimalParts[1].description.replacingOccurrences(of: ".", with: ""))
            result = integerPart + "." + fractionalPart
        }
        return result
    }
    
    func formatNumber(_ values: Double?) -> String {
        guard let value else {
            return ""
        }
        return numberFormatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }
    
    
}

#Preview {
    Preview()
}

fileprivate struct Preview: View {
    @State private var value: Double? = nil
    
    var body: some View {
        InputTextField("$ 65.000", value: $value)
            .padding()
            .infinityFrame()
            .background(Color.appTheme.viewBackground)
    }
}
