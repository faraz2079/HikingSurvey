import Foundation

protocol SentimentScoring {
    func score(_ text: String) -> Double
}
