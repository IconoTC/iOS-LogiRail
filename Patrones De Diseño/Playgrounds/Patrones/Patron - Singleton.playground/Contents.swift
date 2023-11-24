import UIKit

class Database {
    static let shared = Database()
    private init() { }

    func save(message: String) {
        print("Message saved: \(message)")
        // Some logic
    }

    func fetch(message: String) -> String {
        print("Fetch message: \(message)")
        // Some logic
        return ""
    }
}

Database.shared.save(message: "Patronse de diseño - Singleton")
