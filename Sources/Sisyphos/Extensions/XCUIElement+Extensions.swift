import XCTest


extension XCUIElement {

    /// Waits until the element doesn't move on the screen anymore (e.g. because of an ongoing animation). This method
    /// will wait at most until the timeout. If the element doesn't have a stable position after the timeout, this
    /// method will return nevertheless.
    ///
    /// - Parameter timeout: The maximal time to wait until the element is not moving anymore in seconds.
    func waitUntilStablePosition(timeout: CFTimeInterval = 2) {
        XCTContext.runActivity(named: "Wait for element to have a stable position") { activity in
            let timeout = Date(timeIntervalSinceNow: timeout)
            var lastPosition: CGRect = frame
            repeat {
                guard lastPosition != frame else { return }
                lastPosition = frame
                _ = RunLoop.current.run(mode: .default, before: Date(timeIntervalSinceNow: 0.1))
            } while Date() < timeout
        }
    }

}