//
//  UserData.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/10/08.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import Foundation

let daySec = 24 * 60 * 60
let hourSec = 60 * 60
let minSec = 60

struct UserData {
  let price: Int
  let num: Int
  let nonSmokingAt: Date
  let numPerSec: Double
  let nonSmokingSec: Int
  let userDefaults = UserDefaults.standard


  init() {
    num = userDefaults.integer(forKey: "smokingNum")
    price = userDefaults.integer(forKey: "price")
    nonSmokingAt = userDefaults.object(forKey: "startAt") as! Date
    numPerSec = Double(num) / Double(24 * 60 * 60)
    nonSmokingSec = Int(Date().timeIntervalSince(nonSmokingAt))
  }

  var nonSmokingTime: String {
    let days = Int(self.nonSmokingSec / daySec)
    let hours = Int((self.nonSmokingSec - days * daySec) / hourSec)
    let minutes = Int((self.nonSmokingSec - days * daySec - hourSec * hours) / 60)
    let secs = (self.nonSmokingSec - days * daySec - hourSec * hours - minutes * 60)

    return "\(days)日 \(hours)時間 \(minutes)分 \(secs)秒"
  }

  var nonSmokingNum: Int {
    return Int(Double(self.nonSmokingSec) * self.numPerSec)
  }

  var nonSmokingPrice: Int {
    return price * self.nonSmokingNum / 20
  }

  func tableViewData() -> Array<Dictionary<String, String>>{
    let data = [
      ["name": "価格", "value": String(self.price)],
      ["name": "本数", "value": String(self.num)],
      ["name": "日時", "value": self.nonSmokingTime],
      ["name": "禁煙本数", "value": String(self.nonSmokingNum)],
      ["name": "禁煙金額", "value": String(self.nonSmokingPrice)]
    ]
    return data
  }
  
}
