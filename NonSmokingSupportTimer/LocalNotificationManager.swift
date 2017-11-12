//
//  LocalNotificationManager.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/11/12.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import Foundation
import UIKit

class LocalNotificationManager: NSObject {
  static func registNotificationSetting(){
    let notificationSetting = UIUserNotificationSettings(types: [.alert, .sound], categories: nil)
    UIApplication.shared.registerUserNotificationSettings(notificationSetting)
  }

  static func scheduleNotification(alertBody: String, fireDate: Date) {
    if (Date() >= fireDate) {
      return
    }

    let notification = UILocalNotification()
    notification.alertBody = alertBody
    notification.fireDate = fireDate
    notification.soundName = UILocalNotificationDefaultSoundName
    UIApplication.shared.scheduleLocalNotification(notification)
  }
}
