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
  let reason: String
  let price: Int
  let num: Int
  let nonSmokingAt: Date
  let numPerSec: Double
  var nonSmokingSec: Int
  let userDefaults = UserDefaults.standard


  init() {
    if (userDefaults.string(forKey: "reason") != nil) {
      reason = userDefaults.string(forKey: "reason")!
    } else {
      reason = ""
    }

    nonSmokingAt = userDefaults.object(forKey: "startAt") as! Date
    num = userDefaults.integer(forKey: "smokingNum")
    price = userDefaults.integer(forKey: "price")
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
  
  
}
