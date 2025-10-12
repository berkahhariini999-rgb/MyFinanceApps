//
//  InfoBoxView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//

import Foundation
import SwiftUI

struct InfoBoxView: View {
    let data: Data
    
    init(with data: Data){
        self.data = data
    }
    
    var body: some View {
        BoxView(data: .init(
                title: data.title,
                sfSymbol: data.sfSymbol ?? "")
        ) {
            VStack(spacing:12){
                ForEach(data.infoData){
                    infoData in
                    row(for: infoData)
                    if infoData != data.infoData.last {
                        divider
                    }
                }
            }
        }
    }
}

private extension InfoBoxView {
    func row(for infoData: Data.Info) -> some View {
        HStack {
            Text(infoData.title)
            Spacer()
            if let description = infoData.description {
                Text(description)
                    .foregroundStyle(Color.appTheme.secondaryText)
            } else if let urlString = infoData.urlString, let url = URL(string: urlString) {
             Link(destination: url) {
                 HStack(spacing: 4){
                     Image(systemName: "link")
                     Text(String(localized: "Link"))
                 }
                 .foregroundStyle(Color.appTheme.secondaryText)
                 .underline()
                 .fontWeight(.medium)
                }
            }
        }
    }
    
    var divider: some View {
        Divider()
            .foregroundStyle(Color.appTheme.divider)
    }
}

extension InfoBoxView {
    struct Data {
        let title: String
        var sfSymbol: String?
        let infoData: [Info]
    }
}

extension InfoBoxView.Data {
    struct Info {
        let title: String
        let description: String?
        let urlString: String?
        
        init(title: String, description: String? = nil , urlString: String? = nil) {
            self.title = title
            self.description = description
            self.urlString = urlString
        }
    }
}

extension InfoBoxView.Data.Info: Identifiable {
    var id: UUID { UUID() }
}

extension InfoBoxView.Data.Info: Equatable { }

#Preview {
    InfoBoxView(with: .init(title: "Test", infoData: [
        .init(title: "Test")
    ]))
    .padding()
    .infinityFrame()
    .background(Color.gray.opacity(0.6))
}



