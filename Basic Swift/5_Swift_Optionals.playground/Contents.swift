import UIKit

// MARK: - OPCIONALES -

var heroeName: String = "Vegeta"
heroeName.count

var gokuName: String? = "Goku"
let nameCount: Int = gokuName?.count ?? 0

if let name = gokuName,
   let countName = gokuName?.count,
   countName > 3 {
    print("Goku name \(name) characters count \(countName)")
}

func guardLetSample() {
    guard let name = gokuName,
          let countName = gokuName?.count,
          countName > 3 else {
        return
    }

    print("Goku name \(name) characters count \(countName)")
}
