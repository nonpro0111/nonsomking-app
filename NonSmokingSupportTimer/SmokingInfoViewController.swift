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
  static var userData = UserData()
  static let items = userData.tableViewData()

  override func viewDidLoad() {
    let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCellInfoValue(timer:)), userInfo: nil, repeats: true)
    timer.fire()
    super.viewDidLoad()

    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func updateCellInfoValue(timer: Timer) {
    SmokingInfoViewController.userData.nonSmokingSec += 1
    let items = SmokingInfoViewController.userData.tableViewData()

    let allCells = tableView.visibleCells as! [SmokingInfoItemTableViewCell]
    for (i, cell) in allCells.enumerated() {
      cell.infoValue.text = items[i]["value"]
    }

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
      let item = SmokingInfoViewController.items[indexPath.row]
      cell.infoName.text = item["name"]
      cell.infoValue.text = item["value"]
      return cell
    }
    return UITableViewCell()
  }
}

