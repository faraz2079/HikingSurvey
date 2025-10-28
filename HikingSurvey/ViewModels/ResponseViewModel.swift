import Foundation
import SwiftUI
internal import Combine

@MainActor
class ResponseViewModel: ObservableObject {
    
    @Published private(set) var responses: [Response] = []
    
    private let scorer: SentimentScoring
    private let store: ResponsePersisting
    
    init(responses: [Response], scorer: SentimentScoring, store: ResponsePersisting) {
        self.responses = responses
        self.scorer = scorer
        self.store = store
    }
    
    func add(text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        let score = scorer.score(trimmed)
        responses.insert(Response(text: trimmed, score: score), at: 0)
        store.save(responses)
    }
    
    func remove(_ response: Response) {
        if let idx = responses.firstIndex(of: response) {
            responses.remove(at: idx)
            store.save(responses)
        }
    }
    
    func remove(at offsets: IndexSet) {
        responses.remove(atOffsets: offsets)
        store.save(responses)
    }
    
    private func loadOrSeed() {
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
}
