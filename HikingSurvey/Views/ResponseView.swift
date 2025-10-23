//
//  ResponseView.swift
//  HikingSurvey
//
//  Created by Faraz on 10/23/25.
//

import SwiftUI

struct ResponseView: View {
    
    var response: Response
    
    var body: some View {
        Text(response.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(.white)
            )
        Text(response.score
             ,format: .number.rounded(increment: 0.1)
        )
    }
}

#Preview {
    ResponseView(response: Response(text: "I enjoy Hiking very much!", score: 1.0))
}
