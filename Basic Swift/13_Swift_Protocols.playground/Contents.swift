import UIKit

// MARK: - PROTOCOLOS -
protocol SaiyanProtocol {
    var power: Float { get }

    init(power: Float)
    func convertToSaiyan(power: Float)
}

class Heroe: SaiyanProtocol {
    private(set) var power: Float = 0
    static var typeDescription = "Heroe"

    required init(power: Float) {
        self.power = power
    }

    func convertToSaiyan(power: Float) {
        self.power = power
    }
}

class Villain: SaiyanProtocol {
    var power: Float = 0

    required init(power: Float) {
        self.power = power
    }

    func convertToSaiyan(power: Float) {
        self.power = power
    }
}

var krilin = Heroe(power: 10)
var freezer = Villain(power: 17)
freezer.power
freezer.power = 109

var krilinProtocol = krilin as SaiyanProtocol
var freezerProtocol = freezer as SaiyanProtocol

krilinProtocol.convertToSaiyan(power: 40)
freezerProtocol.convertToSaiyan(power: 60)

let saiyans = [krilinProtocol, freezerProtocol]


// MARK: - PATRÓN PROTOCOLO/DELEGADO -
protocol DragonBallDelegate: AnyObject {
    func fightDidStart(_ fighter: String, vs fighter2: String)
    func fightDidEnd(_ winner: String)
}

class DragonBallZ {
    weak var delegate: DragonBallDelegate?

    func startFight() {
        let fighter = "Goku"
        let fighter2 = "Cell"

        delegate?.fightDidStart(fighter, vs: fighter2)
        guard let winner = [fighter, fighter2].randomElement() else { return }
        delegate?.fightDidEnd(winner)
    }
}

class DragonBallFight: DragonBallDelegate {
    func fightDidStart(_ fighter: String, vs fighter2: String) {
        print("Start fight \(fighter) VS \(fighter2)")
    }

    func fightDidEnd(_ winner: String) {
        print("The battle was incredible, in the end \(winner) won")
    }
}

let dragonBallZ = DragonBallZ()
let dragonBallFight = DragonBallFight()

dragonBallZ.delegate = dragonBallFight
dragonBallZ.startFight()
