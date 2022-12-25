//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Kelvin Li on 2022-11-21.
//

import SwiftUI

struct ContentView: View {
    /// if showingScore is true, show scoreTitle
    @State private var showingScore = false
    
    /// placeholder for message shown after flag is picked
    @State private var scoreTitle = ""
    
    /// list of countries
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Monaco", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    /// random interger from 0 - 2
    @State private var correctAnswer = Int.random(in: 0...2)
    
    /// score tracker
    @State private var score = 0

    
    var body: some View {
        VStack {
            
            Spacer()
            
            /// title
            Text("Guess the Flag")
                .foregroundColor(.black)
                .font(.largeTitle.bold())
            
            Spacer()
            
            /// subtitile
            Text("Tap the flag of ")
                .fontWeight(.semibold)
            
            /// correctAnswer
            Text(countries[correctAnswer])
                .font(.title.bold())
                .fontWeight(.bold)
            
            Spacer()
            
            /// button flags
            VStack(spacing: 25) {
                ForEach (0..<3) { number in
                    Button {
                        flaggedTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .cornerRadius(25)
                            .padding()
                            .shadow(radius: 8)
                    }
                }
            }
            
            Spacer()
            
            /// text of current score
            Text("Current Score: \(score)")
                .fontWeight(.semibold)
            Spacer()
            
        } ///  if showingScore is true, create and show alert with title "scorTitle", a button "Continue" that shuffles countries and changes correctAnswer and a text indicating your score
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    
    /// Compares flag tapped and correct flag. If matching, set scoreTitle to "Correct!" and add 1 to score, else set scoreTitle to "Wrong". Set showingScore to "true".
    func flaggedTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    /// Shuffles countries and changes correctAnswer
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
