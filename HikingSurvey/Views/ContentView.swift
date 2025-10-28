//
//  ContentView.swift
//  HikingSurvey
//
//  Created by Faraz on 10/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var textFieldIsFocused: Bool
    @State var responses: [Response] = []
    @State private var responseText = ""
    var scorer = Scorer()
    private let store = ResponseStore()
    
    func saveResponse(text: String) {
        let score = scorer.score(text)
        let response = Response(text: text, score: score)
        responses.insert(response, at: 0) // newElement, at
        store.save(responses)
    }
    
    var body: some View {
        VStack {
            Text("Opinions on Hiking")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding(.top, 24)
            ScrollView {
                ChartView(responses: responses)
                
                ForEach(responses) { response in
                    ResponseView(response: response)
                }
            }
            HStack {
                TextField("What do you think about hiking", text: $responseText)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5)
                Button("Done") {
                    guard !responseText.isEmpty else { return }
                    saveResponse(text: responseText)
                    responseText = ""
                    textFieldIsFocused = false
                }
                .padding(.horizontal, 4)
            }
        }
        .onAppear {
            
            let loaded = store.load()
            if loaded.isEmpty {
                var seeded: [Response] = []
                for s in Response.sampleResponses {
                    let score = scorer.score(s)
                    seeded.insert(Response(text: s, score: score), at: 0)
                }
                responses = seeded
                store.save(seeded)
            } else {
                responses = loaded
            }
        }
        .padding(.horizontal)
        .background(Color(white: 0.94))
    }
}

#Preview {
    ContentView()
}
