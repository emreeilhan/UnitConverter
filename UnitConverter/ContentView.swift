//
//  ContentView.swift
//  UnitConverter
//
//  Created by Emre Ilhan on 19.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State var input: Double = 0
    @State var selectedInputUnit: String = "Meter"
    @State var selectedOutputUnit: String = "Meter"
    var birMetreDegerindeInputlar: [String:Double] = 
    ["Meter": 1.0,
     "Kilometer": 1000.0,
     "Feet":0.3048,
     "Yard":0.9144,
     "Mile": 1609.34]
    
    var result:Double{
        
        
        let inputInMeters =  input * (birMetreDegerindeInputlar[selectedInputUnit] ?? 1.0)
        let output = inputInMeters / (birMetreDegerindeInputlar[selectedOutputUnit] ?? 1.0)
        
        return output
    }
    var units = ["Meter","Kilometer","Feet","Yard","Mile"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Enter", value: $input, format: .number)
                    Picker("Select a Unit", selection: $selectedInputUnit) {
                        ForEach(units, id: \.self){ unit in
                            Text(unit)
                        }
                    }.pickerStyle(.segmented)
                }  header: {
                    Text("Input")
                }
                Section{
                    Picker("Select a Output unit", selection: $selectedOutputUnit) {
                        ForEach(units, id: \.self){ unit in
                            Text(unit)
                        }
                    }.pickerStyle(.segmented)
                    Text(result, format: .number)
                    
                } header:{
                    Text("Output")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
