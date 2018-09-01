//
//  ViewController.swift
//  DynamicCellPractice
//
//  Created by junwoo on 01/09/2018.
//  Copyright © 2018 samchon. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  private let messages = [
    "aaaaaaaaaa",
    "bbbbbbbbfdsfdsfdsfdsfdsfdfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsf",
    "djdj kdkdjdkd kdkdjdjd kdkdjdkdkd kdkdkdkd kdkdkdkdkd kdkdkdkd kdkdkdkdkd kdkdkdkdkd kdkdkdk",
    "dkvbljkdflksdjf;l"
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.separatorStyle = .none
    tableView.register(DynamicCell.self, forCellReuseIdentifier: DynamicCell.cellId)
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

