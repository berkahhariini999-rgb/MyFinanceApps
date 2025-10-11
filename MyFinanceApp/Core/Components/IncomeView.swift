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
    
    var salaryInputView: some View {
        Text("")
    }
    
    var salaryOutputView: some View {
        Text("")
    }
    
    var hourlyInputView: some View {
        Text("")
    }
    
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
