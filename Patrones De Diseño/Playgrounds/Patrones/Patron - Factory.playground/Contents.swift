import UIKit

struct Contact {
    var name: String
    var email: String
    var job: Job
    var desiredSalary: Double

    enum Job {
        case ios
        case android
        case web
    }
}

protocol JobContactProtocol {
    func sendRequestResumeEmail() -> String
}

struct iOSDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact

    init(contact: Contact) {
        self.contact = contact
    }

    func sendRequestResumeEmail() -> String {
        "Dear \(contact.name), this is the best time to be an iOS developer! Send me you're resume today! I have job opportunities that pay \(contact.desiredSalary)."
    }
}

struct AndroidDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact

    init(contact: Contact) {
        self.contact = contact
    }

    func sendRequestResumeEmail() -> String {
        "Dear \(contact.name), this is as decent time to be an Android developer! Send me you're resume today! I have job opportunities that pay close to the \(contact.desiredSalary) you are looking for"
    }
}

struct WebDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact

    init(contact: Contact) {
        self.contact = contact
    }

    func sendRequestResumeEmail() -> String {
        "Dear \(contact.name), Send me you're resume today! I have job opportunities for you."
    }
}

struct JobContacterFactory {
    static func getJobSeeker(contact: Contact) -> JobContactProtocol {
        switch contact.job {
            case .ios:
                iOSDeveloperJobSeeker(contact: contact)
            case .android:
                AndroidDeveloperJobSeeker(contact: contact)
            case .web:
                WebDeveloperJobSeeker(contact: contact)
        }
    }
}


var contacts = [
    Contact(
        name: "I Os",
        email: "ios@email.com",
        job: .ios,
        desiredSalary: 60_000),
    Contact(
        name: "A Droid",
        email: "android@email.com",
        job: .android,
        desiredSalary: 55_000),
    Contact(
        name: "W Eb",
        email: "web@email.com",
        job: .web,
        desiredSalary: 50_000)
]

for contact in contacts {
    let client = JobContacterFactory.getJobSeeker(contact: contact)
    print(client.sendRequestResumeEmail())
}
