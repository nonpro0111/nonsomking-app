//
//  LocalNotificationManager.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/11/12.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class LocalNotificationManager: NSObject {
  static func registNotificationSetting(){
    if #available(iOS 10.0, *) {
      let center = UNUserNotificationCenter.current()
      center.requestAuthorization(options: [.alert, .sound], completionHandler: {(granted, _) in
        if granted {
          debugPrint("許可")
        } else {
          debugPrint("拒否")
        }
      })
    } else {
      let setting = UIUserNotificationSettings(types: [.alert, .sound], categories: nil)
      UIApplication.shared.registerUserNotificationSettings(setting)
    }

  }

  static func scheduleNotification(title: String, alertBody: String, interval: Double) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = alertBody
    content.sound = UNNotificationSound.default()
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
    let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
  }
}
