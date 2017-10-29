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

    setSmokingInfo(num: smokingNum, price: price, reason: reason)
    let smokingInfoView = storyboard!.instantiateViewController(withIdentifier: "smokingInfoView")
    self.present(smokingInfoView, animated: true, completion: nil)
  }

  var isSetStartAt = true

  override func viewDidLoad() {
    super.viewDidLoad()
    reasonTextField.returnKeyType = UIReturnKeyType.done
    reasonTextField.delegate = self
        // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }

  func setSmokingInfo(num: Int, price: Int, reason: String?){
    let userDefaults = UserDefaults.standard
    userDefaults.set(num, forKey: "smokingNum")
    userDefaults.set(price, forKey: "price")
    userDefaults.set(reason, forKey: "reason")

    // 設定済みでデータ変更の場合は、禁煙開始時間は更新しない。
    if (!userDefaults.bool(forKey: "hasSettings")) {
      let now = Date()
      userDefaults.set(now, forKey: "startAt")
      userDefaults.set(true, forKey: "hasSettings")
    }
  }

  // MARK: - UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    reasonTextField.resignFirstResponder()
    return true
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
