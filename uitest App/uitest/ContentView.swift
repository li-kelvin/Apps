//
//  ContentView.swift
//  uitest
//
//  Created by Kelvin Li on 2022-11-19.
//

import SwiftUI

struct ContentView: View {
    @State private var Number = 1
    @State private var Output: Double = 0
    
    var body: some View {
        VStack {
            Text("Gryffindor")
                .blur(radius: 5)
            Text("Hufflepuff")
                .
                .cornerRadius(2)
                .background(.red)
            Text("Ravenclaw")
            Text("Slytherin")
        }
        
            
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
