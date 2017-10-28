//
//  SettingListTableViewCell.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/10/28.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import UIKit

class SettingListTableViewCell: UITableViewCell {

  @IBOutlet weak var settingItem: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
