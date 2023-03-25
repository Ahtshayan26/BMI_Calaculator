//
//  ContentView.swift
//  BMI_Calaculator_Practice
//
//  Created by Niranjan on 2023-03-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var weight = ""
    @State private var height = ""
    @State private var BMI = ""
    
    @State private var weightSlider: Double = 1
    @State private var heightSlider: Double = 1
    
    @State private var showalert = false
    
    // Alert Box Variables
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    @State private var alertbtn = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("BMI Calculator")
                .font(.largeTitle)
            
            TextField("Enter your weight in kilometers", text: $weight)
                .textFieldStyle(.roundedBorder)
                .border(Color.gray)
            
            Slider(value: $weightSlider, in: 1...300) {_ in
                weight = String(format: "%.2f", weightSlider)
            }
            
            TextField("Enter your height in meters", text: $height)
                .textFieldStyle(.roundedBorder)
                .border(Color.gray)
            
            Slider(value: $heightSlider, in: 1...2) {_ in
                height = String(format: "%.2f", heightSlider)
            }
            
            Button("Calculate BMI") {
                showalert = true
                calculateBMI()
            }
            .frame(width: 150, height: 30)
            .font(.title3)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .alert(isPresented: $showalert) {
                Alert(title: Text(alertTitle),
                      message: Text(alertMsg),
                      dismissButton: .default(Text(alertbtn)))
            }
            
            Text("BMI: \(BMI)")
            
        }
        .padding()
    }
    func calculateBMI() {
        guard let w = Double(weight),
              let h = Double(height)
        else {
            alertTitle = "Error"
            alertMsg = "Invalid Inputs!"
            alertbtn = "Exit"
            return
        }
        let bmiVal = w / (h * h)
        
        BMI = String(format: "%.2f", bmiVal)
        
        if (bmiVal > 30){
            alertTitle = "Your BMI"
            alertMsg = "Your BMI is \(bmiVal), High"
            alertbtn = "Exit"
        } else if (bmiVal < 16){
            alertTitle = "Your BMI"
            alertMsg = "Your BMI is \(bmiVal), Low"
            alertbtn = "Exit"
        } else {
            alertTitle = "Your BMI"
            alertMsg = "Your BMI is \(bmiVal), Fine"
            alertbtn = "Exit"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
