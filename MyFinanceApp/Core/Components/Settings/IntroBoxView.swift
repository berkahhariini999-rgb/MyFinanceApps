//
//  IntroBoxView.swift
//  MyFinanceApp
//
//  Created by Iqbal Alhadad on 12/10/25.
//
import SwiftUI

struct IntroBoxView: View {
    let data: Data
    var body: some View {
        BoxView(data: .init(
        title: data.title,
        sfSymbol: data.sfSymbol)
    ) {
        HStack(alignment:.top){
            image
            description
        }
        .frame(height:80)
      }
  }
}

private extension IntroBoxView {
    var image: some View {
        Image(data.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 80)
            .cornerRadius(.overall)
    }
    
    var description: some View {
        Text(data.description)
            .multilineTextAlignment(.leading)
            .font(.footnote)
            .minimumScaleFactor(0.6)
            .foregroundStyle(Color.appTheme.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 4)
    }
}

extension IntroBoxView {
    struct Data {
        let title: String
        let sfSymbol: String?
        let imageName: String
        let description: String
    }
}

#Preview {
    IntroBoxView(
        data: .init(
            title: "My Finance",
            sfSymbol: "heart",
            imageName: "Welcome",
            description: "This App is Amazing"
        )
    )
    .padding()
    .infinityFrame()
    .background(Color.gray.opacity(0.6))
}

