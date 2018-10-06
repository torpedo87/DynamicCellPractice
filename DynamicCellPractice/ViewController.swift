//
//  ViewController.swift
//  DynamicCellPractice
//
//  Created by junwoo on 01/09/2018.
//  Copyright © 2018 samchon. All rights reserved.
//

import UIKit

struct ChatMessage {
  let message: String
  let isIncoming: Bool
  let date: Date
}

class HeaderLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = UIColor.green.withAlphaComponent(0.3)
    textAlignment = .center
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var intrinsicContentSize: CGSize {
    let original = super.intrinsicContentSize
    layer.cornerRadius = (original.height + 10) / 2
    layer.masksToBounds = true
    return CGSize(width: original.width + 10, height: original.height + 10)
  }
}

extension Date {
  static func dateFromCustomString(str: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    return dateFormatter.date(from: str) ?? Date()
  }
}

class ViewController: UITableViewController {
  
  private let messages = [
    [
      ChatMessage(message: "aaaaaaaaaa", isIncoming: true, date: Date.dateFromCustomString(str: "10/03/2018")),
      ChatMessage(message: "bbbbbbbbfdsfdsfdsfdsfdsfdfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsf", isIncoming: true, date: Date.dateFromCustomString(str: "10/03/2018")),
      ChatMessage(message: "djdj kdkdjdkd kdkdjdjd kdkdjdkdkd kdkdkdkd kdkdkdkdkd kdkdkdkd kdkdkdkdkd kdkdkdkdkd kdkdkdk", isIncoming: false, date: Date.dateFromCustomString(str: "10/03/2018"))
    ],
    [
      ChatMessage(message: "dkvbljkdflksdjf", isIncoming: true, date: Date.dateFromCustomString(str: "10/04/2018")),
      ChatMessage(message: "wow", isIncoming: false, date: Date.dateFromCustomString(str: "10/04/2018")),
      ChatMessage(message: "aaa bbbbbb cccccc dddddd  eeeee fffffff ggggggg hhhhhhh  iiiiiiiiii", isIncoming: false, date: Date.dateFromCustomString(str: "10/04/2018")),
      ChatMessage(message: "igjsljfkljsdjf", isIncoming: true, date: Date.dateFromCustomString(str: "10/04/2018"))
    ]
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.separatorStyle = .none
    tableView.register(DynamicCell.self, forCellReuseIdentifier: DynamicCell.cellId)
    tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return messages.count
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let firstMessage = messages[section].first else {
      return nil
    }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    let dateString = dateFormatter.string(from: firstMessage.date)
    
    let label = HeaderLabel()
    label.text = dateString
    
    
    let containerView = UIView()
    containerView.addSubview(label)
    label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    
    return containerView
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages[section].count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: DynamicCell.cellId, for: indexPath) as? DynamicCell {
      cell.configure(message: messages[indexPath.section][indexPath.row])
      return cell
    }
    return DynamicCell()
  }

}
