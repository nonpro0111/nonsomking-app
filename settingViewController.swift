//
//  settingViewController.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/08/13.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import UIKit

class settingViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var smokingNumLabel: UILabel!
  @IBAction func smokingNumStepperTapped(_ sender: UIStepper) {
    let value = Int(sender.value)
    smokingNumLabel.text = "\(value)"
  }
  @IBOutlet weak var priceLabel: UILabel!
  @IBAction func priceStepperTapped(_ sender: UIStepper) {
    let value = Int(sender.value)
    priceLabel.text = "\(value)"

  }
  @IBOutlet weak var smokingNumStepper: UIStepper!
  @IBOutlet weak var priceStepper: UIStepper!
  @IBOutlet weak var setUpButton: UIButton!
  @IBOutlet weak var reasonTextField: UITextField!
  
  @IBAction func setUp(_ sender: Any) {
    let reason = reasonTextField.text
    let price = Int(priceStepper.value)
    let smokingNum = Int(smokingNumStepper.value)

    if setSmokingInfo(num: smokingNum, price: price, reason: reason) {
      let smokingInfoView = storyboard!.instantiateViewController(withIdentifier: "smokingInfoView")
      self.present(smokingInfoView, animated: true, completion: nil)
    }
  }

  var hasSettings: Bool!

  override func viewDidLoad() {
    super.viewDidLoad()
    reasonTextField.returnKeyType = UIReturnKeyType.done
    reasonTextField.delegate = self

    hasSettings = UserDefaults.standard.bool(forKey: "hasSettings")
    setDefaultValues(hasSetting: hasSettings)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }


  // MARK: - UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    reasonTextField.resignFirstResponder()
    return true
  }

  func setSmokingInfo(num: Int, price: Int, reason: String?) -> Bool {
    let userDefaults = UserDefaults.standard
    userDefaults.set(num, forKey: "smokingNum")
    userDefaults.set(price, forKey: "price")
    userDefaults.set(reason, forKey: "reason")

    // 設定済みでデータ変更の場合は、禁煙開始時間は更新しない。
    if (!hasSettings) {
      let now = Date()
      userDefaults.set(now, forKey: "startAt")
      userDefaults.set(true, forKey: "hasSettings")
    }
    return userDefaults.synchronize()
  }

  func setDefaultValues(hasSetting: Bool) {
    var num = 20, price = 440, reason = ""
    if (hasSettings) {
      let userData = UserData()
      num = userData.num
      price = userData.price
      reason = userData.reason
    }
    smokingNumLabel.text = "\(num)"
    smokingNumStepper.value = Double(num)
    priceLabel.text = "\(price)"
    priceStepper.value = Double(price)
    reasonTextField.text = reason
  }

}
