import ConcurrencyHelpers
import XCTest

final class TaskQueueTests: XCTestCase {
  func testOrdered() async {
    var tasks = [Task<TimeInterval, Never>]()
    for _ in 0 ..< 1000 {
      let task = Task.ordered { Date().timeIntervalSince1970 }
      tasks.append(task)
    }

    var array = [TimeInterval]()
    for t in tasks {
      array.append(await t.value)
    }

    XCTAssertEqual(array, array.sorted())
  }
}
