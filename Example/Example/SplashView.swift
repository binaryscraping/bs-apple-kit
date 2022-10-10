//
//  SplashView.swift
//  BS Apple Kit
//
//  Created by Guilherme Souza on 10/10/22.
//

import UIKit
import UIKitHelpers

final class SplashView: BSView {
  override func configure() {
    super.configure()
    let nameLabel = UILabel()
    nameLabel.text = "BS Apple Kit"
    nameLabel.font = .preferredFont(forTextStyle: .largeTitle)

    addSubview(nameLabel)
    nameLabel.centerYInSuperview()
    nameLabel.leadingToSuperview(offset: 20)
  }
}
