import UIKit


/* MARK: - PATRONES - OBSERVER

 El patrón Observer es bastante habitual en el código Swift, 
 sobre todo en los componentes de interfaz. Proporciona una forma
 de reaccionar a los eventos que suceden en otros objetos, sin
 acoplarse a sus clases.
 */

let notificationTest = Notification.Name("TEST_NOTIFICATION")

class CashMachine {
    func money() {
        NotificationCenter.default.post(
            name: notificationTest,
            object: nil,
            userInfo: [
                "userId": 1234,
                "amount": 2_000
            ]
        )
    }
}

class Person {
    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onNotificationTest),
            name: notificationTest,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func onNotificationTest(_ notification: Notification) {
        print("Notification in onNotificationTest(\(notification.name), userId: \(notification.userInfo?["userId"] ?? "")")
    }
}

let person = Person()
let cashMachine = CashMachine()

cashMachine.money()
