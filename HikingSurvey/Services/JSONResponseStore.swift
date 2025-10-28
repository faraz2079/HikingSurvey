import Foundation

final class JSONResponseStore: ResponsePersisting {
    private let fileName = "ResponseStore.json"
    private let io = DispatchQueue(label: "ResponseStore.IO")
    
    var url: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    .appendingPathComponent(fileName)
    }
    
    func load() -> [Response] {
        io.sync {
            guard FileManager.default.fileExists(atPath: url.path()) else { return [] }
            do {
                return try JSONDecoder().decode([Response].self, from: Data(contentsOf: url))
            } catch {
                print("Load Error: ", error)
                return []
            }
        }
    }
    
    func save(_ responses: [Response]) {
        io.sync {
            do {
                try JSONEncoder().encode(responses).write(to: url, options: .atomic)
            } catch {
                print("Save Error: ", error)
            }
        }
    }
    
    
}
