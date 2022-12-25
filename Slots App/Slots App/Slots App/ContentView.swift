//
//  ContentView.swift
//  Slots App
//
//  Created by Kelvin Li on 2022-11-20.
//

import SwiftUI

struct ContentView: View {
    @State var slot1 = 1
    @State var slot2 = 1
    @State var slot3 = 1
    @State var credit = 1000
    @State var notif = " "
    
    var body: some View {
        VStack {
            Spacer()
            Text("Slots App")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            
            HStack {
                Spacer()
                Image("fruit\(slot1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image("fruit\(slot2)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image("fruit\(slot3)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                }
            Spacer()
            VStack {
                Text("Credits: " + String(credit))
                    .padding(.bottom)
                Text(notif)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    
            }
            Spacer()
            Button("Spin / Play") {
                slot1 = Int.random(in: 1...3)
                slot2 = Int.random(in: 1...3)
                slot3 = Int.random(in: 1...3)
                
                if slot1 == slot2 && slot2 == slot3{
                    credit += 50
                    notif = "!!WINNER!!!"
                }
                else {
                    credit -= 5
                    notif = "Play Again"
                }
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(Color.pink)
            .cornerRadius(25)
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
