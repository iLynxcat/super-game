public enum Event {
    case windowResized(WindowSize)
}

public protocol EventListener: AnyObject {
    func onEvent(_ event: Event)
}

extension EventListener {
    public func onEvent(_ event: Event) {}
}

public class EventDispatcher {
    private var delegates: [EventListener] = []

    public func addListener(_ listener: EventListener) {
        delegates.append(listener)
    }

    public func removeListener(_ listener: EventListener) {
        delegates.removeAll { $0 === listener }
    }

    public func dispatch(_ event: Event) {
        for delegate in delegates {
            delegate.onEvent(event)
        }
    }
}
