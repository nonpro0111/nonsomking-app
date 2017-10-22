//
//  SmokingInfoViewController.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/08/06.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import UIKit

class SmokingInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!

  let items = UserData().tableViewData()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - UITableViewDelegate
  // セルの高さ
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }

  // MARK: - UITableViewDataSource
  // セクションの列数
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      // セル数
      return 6
    }
    return 0
  }

  // 表示するセルそのものを返すメソッド
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SmokingInfoItem") as! SmokingInfoItemTableViewCell
      let item = items[indexPath.row]
      cell.infoName.text = item["name"]
      cell.infoValue.text = item["value"]
      return cell
    }
    return UITableViewCell()
  }
}

