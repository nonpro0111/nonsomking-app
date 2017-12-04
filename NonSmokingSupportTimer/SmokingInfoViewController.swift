//
//  SmokingInfoViewController.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/08/06.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import UIKit
import FontAwesome_swift
import NendAd

class SmokingInfoViewController: UIViewController {

  @IBOutlet weak var reasonTextView: UITextView!

  @IBOutlet weak var timeIconLabel: UILabel!
  @IBOutlet weak var timeValueLabel: UILabel!

  @IBOutlet weak var numIconLabel: UILabel!
  @IBOutlet weak var numValueLabel: UILabel!

  @IBOutlet weak var priceIconLabel: UILabel!
  @IBOutlet weak var priceValueLabel: UILabel!

  @IBOutlet weak var adviceTextView: UITextView!
  @IBAction func goSettingList(_ sender: UIBarButtonItem) {
    let settingList = storyboard!.instantiateViewController(withIdentifier: "settingListView")
    self.present(settingList, animated: true, completion: nil)
  }

  var userData: UserData!

  override func viewDidLoad() {
    super.viewDidLoad()
    userData = UserData()

    // 禁煙理由
    reasonTextView.text = userData.reason.isEmpty ? "未記入" : userData.reason

    // テキスト量に合わせて高さ指定
    let height = reasonTextView.sizeThatFits(CGSize(width: reasonTextView.frame.size.width, height: CGFloat.greatestFiniteMagnitude)).height
    reasonTextView.heightAnchor.constraint(equalToConstant: height).isActive = true

    // 禁煙時間
    timeIconLabel.font = UIFont.fontAwesome(ofSize: 28)
    timeIconLabel.text = String.fontAwesomeIcon(code: "fa-clock-o")
    timeValueLabel.text = userData.nonSmokingTime

    let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateNonSmokingTime(timer:)), userInfo: nil, repeats: true)
    timer.fire()

    // 禁煙本数
    numIconLabel.font = UIFont.fontAwesome(ofSize: 28)
    numIconLabel.text = String.fontAwesomeIcon(code: "fa-ban")
    numValueLabel.text = String(userData.nonSmokingNum) + " 本"

    // 節約金額
    priceIconLabel.font = UIFont.fontAwesome(ofSize: 28)
    priceIconLabel.text = String.fontAwesomeIcon(code: "fa-jpy")
    priceValueLabel.text = userData.nonSmokingPrice.currencyFormatStr + " 円"

    let advice = AppConstants.Advice
    let random = Int(arc4random_uniform(UInt32(advice.count)))
    adviceTextView.text = advice[random]

    NotificationCenter.default.addObserver(self, selector: #selector(SmokingInfoViewController.viewWillEnterForeground(_:)), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)

  }

  @objc func viewWillEnterForeground(_ notification: Notification?) {
    NADInterstitial.sharedInstance().showAd(from: self)
  }

  override func viewWillAppear(_ animated: Bool) {
    self.navigationItem.title = "禁煙"
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @objc func updateNonSmokingTime(timer: Timer) {
    userData.nonSmokingSec += 1
    timeValueLabel.text = userData.nonSmokingTime
  }
}

