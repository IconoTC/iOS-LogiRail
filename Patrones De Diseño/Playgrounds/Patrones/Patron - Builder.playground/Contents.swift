import UIKit

/* MARK: - PATRÓN BUILDER -
 Resulta especialmente útil cuando debes crear un objeto
 con muchas opciones posibles de configuración
 */

enum CarSize {
    case small
    case medium
    case big
}

enum EngineSize {
    case small
    case medium
    case big
}


/* MARK: - PATRÓN BUILDER FAIL
class Car {
    let numberOfWheels: Int
    let color: UIColor
    let size: CarSize
    let motor: EngineSize

    init(numberOfWheels: Int, color: UIColor, size: CarSize, motor: EngineSize) {
        self.numberOfWheels = numberOfWheels
        self.color = color
        self.size = size
        self.motor = motor
    }
}
*/


// MARK: - PATRÓN BUILDER SUCCESS
protocol Vehicle {
    var numberOfWheels: Int? { get set }
    var color: UIColor? { get set }
    var size: CarSize? { get set }
    var motor: EngineSize? { get set }
}

class Car: Vehicle {
    var numberOfWheels: Int?
    var color: UIColor?
    var size: CarSize?
    var motor: EngineSize?
}

class Moto: Vehicle {
    var numberOfWheels: Int?
    var color: UIColor?
    var size: CarSize?
    var motor: EngineSize?
}

class VehicleBuilder {
    private var vehicle: Vehicle

    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }

    func addWheels(_ numberOfDoors: Int) -> VehicleBuilder {
        vehicle.numberOfWheels = numberOfDoors
        return self
    }

    func addColor(_ color: UIColor) -> VehicleBuilder {
        vehicle.color = color
        return self
    }

    func addSize(_ size: CarSize) -> VehicleBuilder {
        vehicle.size = size
        return self
    }

    func addMotor(_ size: EngineSize) -> VehicleBuilder {
        vehicle.motor = size
        return self
    }

    func build() -> Vehicle {
        vehicle
    }
}

let myNewCar = VehicleBuilder(vehicle: Car())
    .addWheels(4)
    .addSize(.big)
    .addMotor(.big)
    .build()

let myNewMoto = VehicleBuilder(vehicle: Moto())
    .addWheels(2)
    .addSize(.small)
    .addMotor(.medium)
    .build()
