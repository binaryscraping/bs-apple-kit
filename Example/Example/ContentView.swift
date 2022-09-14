//
//  ContentView.swift
//  BS Apple Kit
//
//  Created by Guilherme Souza on 26/08/22.
//

import SwiftUI
import SwiftUIHelpers

struct Destination: Hashable, Identifiable {
  var id: String { name }

  let name: String
  let content: AnyView

  static func == (lhs: Destination, rhs: Destination) -> Bool {
    lhs.name == rhs.name
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(name)
  }

  static let all: [Destination] = [
    Destination(
      name: "AsyncButton",
      content: AnyView(
        AsyncButton(
          "Execute",
          action: {
            try? await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
          }
        )
      )
    ),
  ]
}

struct ContentView: View {
  @State var destination: Destination?

  var body: some View {
    NavigationSplitView {
      List(Destination.all, selection: $destination) { destination in
        NavigationLink(destination.name, value: destination)
      }
      .navigationTitle("Examples")
    } detail: {
      if let destination {
        destination.content
          .navigationTitle(destination.name)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
