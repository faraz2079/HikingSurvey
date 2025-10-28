import Foundation

protocol ResponsePersisting {
    var url: URL { get }
    func load() -> [Response]
    func save(_ responses: [Response]) 
}
