//
//  ContentView.swift
//  HikingSurvey
//
//  Created by Faraz on 10/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var responses: [Response] = []
    
    var body: some View {
        VStack {
            Text("Opinions on Hiking")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding(.top, 24)
            ScrollView {
                ForEach(responses) { response in
                    Text(response.text)
                }
            }
        }
        .onAppear {
            for response in Response.sampleResponses {
                responses.insert(Response(text: response), at: 0)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
