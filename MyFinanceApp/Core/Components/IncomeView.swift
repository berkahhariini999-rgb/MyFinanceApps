//
//  IncomeView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 11/10/25.
//

import SwiftUI

struct IncomeView: View {
    @StateObject private var viewModel = IncomeViewModel()
    var body: some View {
        incomeView
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            toolbarItems
        }
        
    }
}

private extension IncomeView {
    var incomeView: some View {
        ScrollView {
            VStack(spacing: 16){
                IncomePickerView($viewModel.incomePickerValue)
                switch viewModel.incomePickerValue {
                case .salary:
                    salaryView
                case .hourly:
                    hourlyView
                }
            }
            .padding(.horizontal)
            .padding(.vertical,8)
        }
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
        .animation(.easeIn, value: viewModel.incomePickerValue)
    }
    
    @ViewBuilder
    var salaryView: some View {
        salaryInputView
        salaryOutputView
    }
    
    @ViewBuilder
    var hourlyView: some View {
        hourlyInputView
        hourlyOutputView
    }
    
    @ViewBuilder
    var salaryInputView: some View {
        InputView(value: $viewModel.salaryInput.yearlyGross, info: .init(name: "Yearly Gross ($)", placeholder: "$ 65,000", required: true))
        InputView(value: $viewModel.salaryInput.takeHomePercentage, info: .init(name: "Take Home (%)", placeholder: "83.00 %"))
    }
    
    @ViewBuilder
    var salaryOutputView: some View {
        Text("")
    }
    
    @ViewBuilder
    var hourlyInputView: some View {
        InputView(value: $viewModel.hourlyInput.hourlyImage, info: .init(name: "Hourly Wage ($)", placeholder: "$ 36.50", required: true))
        InputView(value: $viewModel.hourlyInput.hourlyImage, info: .init(name: "Hours Per Week", placeholder: "40", required: true))
        InputView(value: $viewModel.hourlyInput.hourlyImage, info: .init(name: "Take Home (%)", placeholder: "83.00 %"))
        
        
    }
    
    @ViewBuilder
    var hourlyOutputView: some View {
        Text("")
    }
    
    @ToolbarContentBuilder
    var toolbarItems: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            HStack(spacing:5){
                Image(systemName: "dollarsign.circle")
                    .foregroundStyle(Color.appTheme.accent)
                Text(viewModel.appName)
            }
            .fontWeight(.semibold)
        }
    }
}

#Preview {
    NavigationStack{
        IncomeView()
    }
    
}
