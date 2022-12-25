//
//  ContentView.swift
//  WeSplit App
//
//  Created by Kelvin Li on 2022-11-20.
//

import SwiftUI

struct ContentView: View {
    @State private var chequeAmount = 0.00
    @State private var tipPercentage = 0
    @State private var numberOfPeople = 0
    @FocusState private var amountIsFocused: Bool

    let tipPecentages = [0, 10, 15, 20, 25]
    
    var totalTip: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = chequeAmount/100*tipSelection
        
        return tipValue
    }
    
    var totalBill: Double {
        let grandTotal = chequeAmount + totalTip
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalBill/peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $chequeAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Bill Amount")
                }
                
                Section {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                } header: {
                    Text("Number of people splitting the cheque")
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPecentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip would you like to leave?")
                }
                
                Section {
                    Text(totalTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Total Tip Amount")
                }
                
                Section {
                    Text(totalBill, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Total Bill Amount")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount Per Person")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
