//
//  IntExtension.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/11/03.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import Foundation

extension Int {
  // Int型を3桁ごとにカンマで区切る
  var currencyFormatStr: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = NumberFormatter.Style.decimal
    numberFormatter.groupingSize = 3
    numberFormatter.groupingSeparator = ","
    return numberFormatter.string(from: self as NSNumber)!
  }
}
