//
//  UiView.swift
//  SwiftUiApp
//
//  Created by Анна Голубева on 04.06.2021.
//

import SwiftUI

struct UiView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Rectangle()
            .frame(width: 380, height: 200)
            .foregroundColor(Color(red: red / 255, green: green / 255, blue: blue / 255))
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(Color.white, lineWidth: 4)
        )
    }
}

struct UiView_Previews: PreviewProvider {
    static var previews: some View {
        UiView(red: 10, green: 10, blue: 10)
    }
}
