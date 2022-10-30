import SwiftUI

/// A control that initiates an async action.
public struct AsyncButton<Label: View>: View {
  let label: Label
  let action: () async -> Void

  /// The active task.
  @State private var task: Task<Void, Never>?
  /// Whether the action is in flight or not.
  @State private var inFlight = false

  public init(action: @escaping () async -> Void, @ViewBuilder label: () -> Label) {
    self.action = action
    self.label = label()
  }

  public var body: some View {
    Button {
      task = Task.detached(priority: .userInitiated) { @MainActor in
        inFlight = true
        defer { inFlight = false }

        await action()
      }
    } label: {
      ZStack {
        label.opacity(inFlight ? 0 : 1)

        if inFlight {
          ProgressView()
        }
      }
    }
    .onDisappear { task?.cancel() }
    .allowsHitTesting(!inFlight)
  }
}

extension AsyncButton<Text> {
  public init(_ title: some StringProtocol, action: @escaping () async -> Void) {
    self.init(action: action, label: { Text(title) })
  }

  public init(_ titleKey: LocalizedStringKey, action: @escaping () async -> Void) {
    self.init(action: action, label: { Text(titleKey) })
  }
}
