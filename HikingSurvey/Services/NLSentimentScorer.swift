import Foundation
import NaturalLanguage

final class NLSentimentScorer: SentimentScoring {
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    func score(_ text: String) -> Double {
        var sentimentScore = 0.0
        tagger.string = text
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .paragraph, scheme: .sentimentScore, options: []) { sentimentTag, _ in
            if let sentimentScoreTag = sentimentTag?.rawValue, let score = Double(sentimentScoreTag) {
                sentimentScore = score
                return true
            }
            return false
        }
        return sentimentScore
    }
}
