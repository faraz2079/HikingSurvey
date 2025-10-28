//
//  ContentView.swift
//  HikingSurvey
//
//  Created by Faraz on 10/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ResponseViewModel(scorer: NLSentimentScorer(), store: JSONResponseStore())
    
    @FocusState private var textFieldIsFocused: Bool
    @State private var responseText = ""
    
    var body: some View {
        VStack {
            Text("Opinions on Hiking")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding(.top, 24)
            ScrollView {
                ChartView(responses: vm.responses)
                
                ForEach(vm.responses) { response in
                    ResponseView(response: response)
                }
            }
            HStack {
                TextField("What do you think about hiking", text: $responseText)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5)
                Button("Done") {
                    guard !responseText.isEmpty else { return }
                    vm.add(text: responseText)
                    responseText = ""
                    textFieldIsFocused = false
                }
                .padding(.horizontal, 4)
            }
        }
        .padding(.horizontal)
        .background(Color(white: 0.94))
    }
}

#Preview {
    ContentView()
}
