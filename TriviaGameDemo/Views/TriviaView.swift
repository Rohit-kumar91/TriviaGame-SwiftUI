//
//  TriviaView.swift
//  TriviaGameDemo
//
//  Created by Rohit Prajapati on 25/12/21.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManger: TriviaManager
    var body: some View {
        if triviaManger.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .lilacTitle()
                
                Text("Congratulations, you completed the game")
                
                Text("Your scored \(triviaManger.score) out of \(triviaManger.length)")
                
                Button {
                    Task.init {
                        await triviaManger.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play Again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        } else {
            QuestionsView()
                 .environmentObject(triviaManger)
        }
       
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
