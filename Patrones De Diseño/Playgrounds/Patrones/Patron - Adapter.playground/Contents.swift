import EventKit

protocol Event: AnyObject {
    var title: String { get }
    var startDate: String { get }
    var endDate: String { get }
}

extension Event {
    var description: String {
        return "Name: \(title)\nEvent start: \(startDate)\nEvent end: \(endDate)"
    }
}

// MARK: - Adapter -
class EKEventAdapter: Event {
    private var event: EKEvent

    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormatter
    }()

    var title: String {
        return event.title
    }
    var startDate: String {
        return dateFormatter.string(from: event.startDate)
    }
    var endDate: String {
        return dateFormatter.string(from: event.endDate)
    }

    init(event: EKEvent) {
        self.event = event
    }
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"

let eventStore = EKEventStore()
let event = EKEvent(eventStore: eventStore)
event.title = "Design Patterns"
event.startDate = dateFormatter.date(from: "11/03/2023 16:00")
event.endDate = dateFormatter.date(from: "11/03/2023 19:30")

let adapter = EKEventAdapter(event: event)
adapter.description

// Result:
// Name: Design Patterns
// Event start: 11/03/2023 16:00
// Event end: 11/03/2023 19:30
