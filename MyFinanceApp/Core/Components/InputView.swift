//
//  InputView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import SwiftUI

struct InputView: View {
    @Binding var value: Double?
    let info: Info
    var body: some View {
        HStack(spacing:16){
            name
            textField
        }
    }
}

private extension InputView {
    var name: some View {
        Group {
            Text(info.name) + Text (info.required ? "*" : "")
                .foregroundStyle(Color.appTheme.destructive)
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(Color.appTheme.secondaryText)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var textField: some View {
        InputTextField(info.placeholder, value: $value)
    }
}

#Preview {
    Preview()
}

fileprivate struct Preview: View {
    @State private var value: Double? = nil
    var body: some View {
        InputView(value: $value, info: .init(name: "Yearly Gross ($)", placeholder: "$ 65,000", required: true))
            .padding()
            .infinityFrame()
            .background(Color.appTheme.viewBackground)
    }
}

extension InputView {
    struct Info {
        let name:String
        let placeholder:String
        let required: Bool
        
        init(name: String, placeholder: String, required: Bool = false) {
            self.name = name
            self.placeholder = placeholder
            self.required = required
        }
        
    }
}
