//
//  DynamicCell.swift
//  DynamicCellPractice
//
//  Created by junwoo on 01/09/2018.
//  Copyright © 2018 samchon. All rights reserved.
//

import UIKit

class DynamicCell: UITableViewCell {
  
  static let cellId = "Dynamic Cell"
  private lazy var bubbleView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    view.layer.cornerRadius = 5
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private lazy var messageLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    addSubview(bubbleView)
    addSubview(messageLabel)
    let constraints = [
      messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
      messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
      messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
      messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
      bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10),
      bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -10),
      bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 10),
      bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 10)
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(message: String) {
    messageLabel.text = message
  }
  
}
