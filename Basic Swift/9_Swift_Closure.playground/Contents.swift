import UIKit

// MARK: - CLOSURE -

func funCalculateSaiyan(power: Float) -> Float {
    power * 20
}


typealias CalculateSaiyanPowerCallback = (Float) -> Float

let calculateSaiyan: CalculateSaiyanPowerCallback = { $0 * 20 }
calculateSaiyan(40)


typealias BattleWinner = (String) -> ()

func battle(between fighter1: String, and fighter2: String, callback: @escaping BattleWinner) {
    let fighters = [fighter1, fighter2]

    guard let winner = fighters.randomElement() else { return }
    callback(winner)
}

battle(between: "Goku",
       and: "Vegeta",
       callback: { winner in
    print("Battle winner closure: \(winner)")
})

print()
battle(between: "Goku",
       and: "Vegeta") { winner in
    print("OTRA VEZ! closure: \(winner)")
}


let characters: [String] = ["Goku", "Vegeta", "Bu", "Freezer", "Cell"]

print()
characters.forEach { character in
    print(character)
}


let charactersNameCount = characters.map { character in
    character.count
}

let charactersOptionals: [String?] = ["Goku", nil, "Bu", "Freezer", nil]
let charactersNotOptionals = charactersOptionals.compactMap { $0 }

print(charactersNotOptionals)


characters.filter { $0.count > 4 }


characters.contains { character in
    character == "Goku"
}

characters.first { character in
    character.count == 7
}


let charactersPower = [("Goku", 95), ("Vegeta", 90), ("Gohan", 100), ("Freezer", 85), ("Bu", 94)]

charactersPower.reduce(into: 0) { powerSum, character in
    print(powerSum)
    powerSum = powerSum + character.1
}
