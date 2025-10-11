//
//  IncomePickerView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import SwiftUI

struct IncomePickerView: View {
    @Binding var currentSelection: IncomeType
    
    init(_ currentSelection: Binding<IncomeType>){
        self._currentSelection = currentSelection
    }
    
    var body: some View {
        GeometryReader {
            proxy in
            ZStack(alignment: .leading){
                backgroundView(proxy: proxy)
                pickerView
            }
            .background(RoundedRectangle(cornerRadius: AppCornerRadius.button.value)
                .foregroundStyle(Color.cellBackground.opacity(0.4))
            )
            .shadow(.regular)
        }
        .frame(height:40)
    }
    
    private func select(_ type: IncomeType){
        withAnimation {
            currentSelection = type
        }
    }
}

private extension IncomePickerView {
    @ViewBuilder
    func backgroundView(proxy: GeometryProxy) -> some View {
        let selectedIndex = IncomeType.allCases.firstIndex(of: currentSelection) ?? 0
        let buttonWidth = proxy.size.width / CGFloat(IncomeType.allCases.count)
        let backgroundOffset = CGFloat(selectedIndex) * buttonWidth
        RoundedRectangle(cornerRadius: AppCornerRadius.button.value)
            .foregroundStyle(Color.cellBackground)
            .frame(width: buttonWidth)
            .offset(x: backgroundOffset)
            .animation(.spring(response: 0.5, dampingFraction: 0.7), value: currentSelection)
    }
    
    var pickerView: some View {
        HStack(spacing:0){
            ForEach(IncomeType.allCases){
                type in
                OptionButton(type: type, isSelected: currentSelection == type) {
                    select(type)
                }
            }
        }
    }
}


extension IncomePickerView {
    struct OptionButton: View {
        let type: IncomeType
        let isSelected: Bool
        let action:() -> ()
        
        var body: some View {
            Button {
                action()
            } label: {
                Text("\(type.description)")
                    .font(.callout.weight(.medium))
                    .minimumScaleFactor(0.4)
                    .padding(8)
                    .foregroundColor(isSelected ? Color.appTheme.text : Color.appTheme.text.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .center)
                
            }
        }
    }
}

extension IncomePickerView {
    enum IncomeType {
        case salary
        case hourly
    }
}

extension IncomePickerView.IncomeType: Identifiable {
    var id:UUID {
        .init()
    }
}

extension IncomePickerView.IncomeType:CustomStringConvertible {
    var description: String {
        switch self {
            case .salary:
            "Salary"
        case .hourly:
            "Hourly"
        }
    }
}
extension IncomePickerView.IncomeType: CaseIterable {}

#Preview {
    Preview()
}

fileprivate struct Preview: View {
    @State private var incomeType: IncomePickerView.IncomeType = .hourly
    
    var body: some View {
        IncomePickerView($incomeType)
            .padding()
            .infinityFrame()
            .background(Color.appTheme.viewBackground)
    }
}
