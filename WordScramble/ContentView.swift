//
//  ContentView.swift
//  WordScramble
//
//  Created by Marcello Gonzatto Birkan on 06/08/24.
//

import SwiftUI

struct ContentView: View {
  @State private var usedWords = [String]()
  @State private var rootWord = ""
  @State private var newWord = ""
  
    var body: some View {
      NavigationStack {
        List {
          Section {
            TextField("Enter your word", text: $newWord)
              .textInputAutocapitalization(.never)
          }
          
          Section {
            ForEach(usedWords, id: \.self) { word in
              Label(word, systemImage: "\(word.count).circle")
            }
          }
        }
        .navigationTitle(rootWord)
        .onSubmit() {
          addNewWord()
        }
      }
    }
  
  func addNewWord() {
    let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    
    guard answer.count > 0 else { return }
    
    withAnimation {
      usedWords.insert(answer, at: 0)
    }
    newWord = ""
  }
}

#Preview {
    ContentView()
}
