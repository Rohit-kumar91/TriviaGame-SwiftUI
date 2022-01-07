//
//  QuestionView.swift
//  TriviaGameDemo
//
//  Created by Rohit Prajapati on 25/12/21.
//

import SwiftUI

struct QuestionsView: View {
    
    @EnvironmentObject var triviaManger: TriviaManager
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Trivia Game")
                    .lilacTitle()
                
                Spacer()
                
                Text("\(triviaManger.index + 1) out of \(triviaManger.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: triviaManger.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(triviaManger.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(triviaManger.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManger)
                }
                
            }
            
            Button {
                triviaManger.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: triviaManger.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!triviaManger.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
            .environmentObject(TriviaManager())
    }
}
