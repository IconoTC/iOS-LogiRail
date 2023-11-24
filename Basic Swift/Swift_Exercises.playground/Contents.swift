import UIKit

// MARK: - Character TYpe
// Enum for character type with two options 'heroe' or 'villain'
enum CharacterType: CustomStringConvertible {
    case heroe
    case villain
    
    // Use CustomStringConvertible and description
    // to print String representation of the enum
    // we can localize all strings with this method
    var description: String {
        switch self {
            case .heroe:
                return "Heroe"

            case .villain:
                return "Villain"
        }
    }
}

// MARK: - Character Struct
struct SerieCharacter: CustomStringConvertible {
    var name: String
    var power: Float
    var type: CharacterType

    // Use description var of CustomStringConvertible
    // to print this struct with custom String format
    public var description: String {
        // With """ we can print a multiline String
        """
        Character:
        name: \(String(describing: name))
        power: \(String(describing: power))
        type: \(String(describing: type))
        """
    }
}

// MARK: - DragonBall Class
public class DragonBall: CustomStringConvertible {
    // Properties whit optional '?' value
    var name: String?
    var heroes: [SerieCharacter] = []
    var villains: [SerieCharacter] = []
    
    // Use description var of CustomStringConvertible
    // to print this class with custom String format
    public var description: String {
        // With """ we can print a multiline String
        return """
        DragonBall:
        name: \(String(describing: name))
        heroes: \(String(describing: heroes))
        villains: \(String(describing: villains))
        """
    }
    
    // Custom init (Constructor) class with default values
    convenience init(name: String? = nil, heroes: [SerieCharacter], villains: [SerieCharacter]) {
        self.init()
        
        // Always init all properties
        self.name = name
        self.heroes = heroes
        self.villains = villains
    }
}

// MARK: - DEFAULT DATA
// Create list of Heroes
let heroes: [SerieCharacter] = [SerieCharacter(name: "Goku",
                                               power: 97,
                                               type: .heroe),
                                SerieCharacter(name: "Gohan",
                                               power: 100,
                                               type: .heroe),
                                SerieCharacter(name: "Trunks",
                                               power: 89,
                                               type: .heroe),
                                SerieCharacter(name: "Vegeta",
                                               power: 93,
                                               type: .heroe),
                                SerieCharacter(name: "Krilin",
                                               power: 70,
                                               type: .heroe),
                                SerieCharacter(name: "Piccolo",
                                               power: 77,
                                               type: .heroe)]

// Create list of Villains
let villains: [SerieCharacter] = [SerieCharacter(name: "Freezer",
                                                 power: 80,
                                                 type: .villain),
                                  SerieCharacter(name: "Bu",
                                                 power: 90,
                                                 type: .villain),
                                  SerieCharacter(name: "Broly",
                                                 power: 97,
                                                 type: .villain),
                                  SerieCharacter(name: "Cell",
                                                 power: 85,
                                                 type: .villain),
                                  SerieCharacter(name: "Ginyu",
                                                 power: 75,
                                                 type: .villain),
                                  SerieCharacter(name: "Dabra",
                                                 power: 70,
                                                 type: .villain)]

// Create Dragon Ball
let dragonBallZ = DragonBall(name: "Dragon Ball Z",
                             heroes: heroes,
                             villains: villains)


// MARK: - TASKS -
// MARK: - TASK 1
// Print:
// Heores Name + Power
// Heroes count
print("************** TASK 1 **************")
print()
dragonBallZ.heroes.forEach { heroe in
    // Get only valid names, not nil
    guard !heroe.name.isEmpty else { return }
    print("Heroe name: \(heroe.name) power: \(heroe.power)")
    print()
}
print("Heroes count: \(dragonBallZ.heroes.count)")
print()

// MARK: - TASK 2
// Print:
// Villains Name + Power
// Villains count
print("************** TASK 2 **************")
print()
dragonBallZ.villains.forEach { villain in
    // Get only valid names, not nil
    guard !villain.name.isEmpty else { return }
    print("Villain name: \(villain.name) power: \(villain.power)")
    print()
}
print("Villains count: \(dragonBallZ.villains.count)")
print()


// MARK: - TASK 3
// Print:
// Heores with power greater than 90
print("************** TASK 3 **************")
print()
let heroes90Power = dragonBallZ.heroes.filter { $0.power > 90 }
print("Heroes 90 power: \(heroes90Power)")
print()


// MARK: - TASK 4
// Print:
// Villains with power greater than 80 and less than 90
print("************** TASK 4 **************")
print()
let villainspPower90 = dragonBallZ.villains.filter { ($0.power > 80) && ($0.power < 90) }
print("Villains 90 power: \(villainspPower90)")
print()


// MARK: - TASK 5
// Print:
// Heores name with more than 4 characters
print("************** TASK 5 **************")
print()
let heroes4Characters = dragonBallZ.heroes.filter { $0.name.count > 4 }
print("Heroes 4 characters: \(heroes4Characters)")
print()


// MARK: - TASK 6
// Print:
// Heores power sum
print("************** TASK 6 **************")
print()
let heroesPowerSum = dragonBallZ.heroes.reduce(into: Float(0)) { powerSum, heroe in
    powerSum += heroe.power
}
print("Heroes power sum: \(heroesPowerSum)")
print()


// MARK: - TASK 7
// Print:
// Villains power sum
print("************** TASK 7 **************")
print()
let villainsPowerSum = dragonBallZ.villains.reduce(into: Float(0)) { powerSum, villain in
    powerSum += villain.power
}
print("Villains power sum: \(villainsPowerSum)")
print()


// MARK: - TASK 8
// Print:
// Check Heroes contain Krilin heroe
print("************** TASK 8 **************")
print()
let containsHeroeKrilin = dragonBallZ.heroes.contains { $0.name == "Krilin" }
print("Herores contains Krilin: \(containsHeroeKrilin)")
print()


// MARK: - TASK 9
// Print:
// Check Villains contain Freezer villain
print("************** TASK 9 **************")
print()
let containsVillainsFreezer = dragonBallZ.villains.contains { $0.name == "Freezer" }
print("Villains contains Freezer: \(containsVillainsFreezer)")
print()


// MARK: - TASK 10
// Print:
// Heroes power
print("************** TASK 10 **************")
print()
let heroesPower = dragonBallZ.heroes.map { $0.power }
print("Heroes power: \(heroesPower)")
print()


// MARK: - TASK 11
// Print:
// Villains power
print("************** TASK 10 **************")
print()
let villainsPower = dragonBallZ.villains.map { $0.power }
print("Villains power: \(villainsPower)")
print()
