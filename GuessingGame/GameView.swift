//
//  GameView.swift
//  GuessingGame
//
//  Created by 曾梓恒 on 2025-01-16.
//

import SwiftUI

struct GameView: View {
    
    // MARK: Stored properties
    
    // What number the user has guessed
    @State var givenInput = ""
    
    // What number the computer wants the user to guess
    @State var target = Int.random(in: 1...100)
    
    // Feedback to the user on what to try next
    @State var feedback = ""
    // The list of numbers the user has guessed so far
    @State var guessesMade: [Int] = []
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 30) {
                
                Text("I'm thinking of a number between 1 and 100.")
                
                Text("Guess what it is!")
                    .font(.headline)
                
                TextField("Make a guess", text: $givenInput)
                
                Button {
                    checkGuess()
                } label: {
                    Text("Submit Guess")
                }
                .buttonStyle(.borderedProminent)
                
                Text(feedback)
                    .font(
                        .custom(
                            "BradleyHandITCTT-Bold",
                            size: 24.0,
                            relativeTo: .title3
                        )
                    )
                    

                Button {
                    reset()
                } label: {
                    Text("Reset")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)

                
                // Show the user's guesses
                Text("Guesses made")
                    .font(.title3.smallCaps())
                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(guessesMade, id: \.self) { currentGuess in
                            Text("\(currentGuess)")
                            Divider()
                        }
                    }
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Guessing Game")
            
        }

    }
    
    // MARK: Functions
    func checkGuess() {
        
        // Provide feedback to the user
        // When should they guess higher?
        // When should then guess lower?
        // FILL IN THIS CODE
        
        // Attempt to unwrap the input provided by the user
        guard let selectedNumber = Int(givenInput) else {
            feedback = "Please provide an integer."
            return
        }
        
        if selectedNumber == target {
            feedback = "🎉 Congrats, you guessed the right number!!"
        } else if selectedNumber > target {
            feedback = "📉 Too high... try guessing lower!"
        } else {
            feedback = "📈 Too low... try guessing higher!"
        }
        
        
        // Save the user's guesses
        guessesMade.append(selectedNumber)
        
    }

    // Start a new game
    func reset() {

        // Start the user back with an empty string
        givenInput = ""
        
        // Have the computer guess a new number
        target = Int.random(in: 1...100)
        
        // Reset feedback
        feedback = ""
        
        // Remove guesses made
        guessesMade.removeAll()
        
    }

}

#Preview {
    GameView()
}
