//
//  ContentView.swift
//  SwiftUiApp
//
//  Created by Анна Голубева on 04.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(.lightGray)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                UiView(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue)
                ColorSlider(value: $redSliderValue, color: .red)
                ColorSlider(value: $greenSliderValue, color: .green)
                ColorSlider(value: $blueSliderValue, color: .blue)
                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    @State private var showAlert = false
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(color)
            
            Slider(value: $value, in: 0...255, step: 1)
            
            TextField("", value: $value, formatter: NumberFormatter(), onCommit: checkTextField)
                .frame(width: 32, height: 16)
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Wrong Format!"),
                        message: Text("Enter value from 0 to 255")
                    )
                }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
    
    private func checkTextField() {
        if value < 0 || value > 255 {
            showAlert = true
            value = 0
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
