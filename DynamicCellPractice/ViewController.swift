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
}

class ViewController: UITableViewController {
  
  private let messages: [ChatMessage] = [
    ChatMessage(message: "aaaaaaaaaa", isIncoming: true),
    ChatMessage(message: "bbbbbbbbfdsfdsfdsfdsfdsfdfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsf", isIncoming: true),
    ChatMessage(message: "djdj kdkdjdkd kdkdjdjd kdkdjdkdkd kdkdkdkd kdkdkdkdkd kdkdkdkd kdkdkdkdkd kdkdkdkdkd kdkdkdk", isIncoming: false),
    ChatMessage(message: "dkvbljkdflksdjf", isIncoming: true),
    ChatMessage(message: "wow", isIncoming: false),
    ChatMessage(message: "aaa bbbbbb cccccc dddddd  eeeee fffffff ggggggg hhhhhhh  iiiiiiiiii", isIncoming: false),
    ChatMessage(message: "igjsljfkljsdjf", isIncoming: true)
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.separatorStyle = .none
    tableView.register(DynamicCell.self, forCellReuseIdentifier: DynamicCell.cellId)
    tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: DynamicCell.cellId, for: indexPath) as? DynamicCell {
      cell.configure(message: messages[indexPath.row])
      return cell
    }
    return DynamicCell()
  }

}

