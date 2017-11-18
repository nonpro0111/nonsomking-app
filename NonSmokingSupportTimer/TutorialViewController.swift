//
//  TutorialViewController.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/11/18.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

  @IBOutlet weak var goSettingButton: UIButton!

  @IBAction func goSetting(_ sender: Any) {
    let settingView = storyboard!.instantiateViewController(withIdentifier: "settingView")
    self.present(settingView, animated: false, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    goSettingButton.setTitle("禁煙開始する", for: UIControlState.normal)
    goSettingButton.setTitleColor(UIColor.white, for: UIControlState.normal)
    goSettingButton.backgroundColor = UIColor(red: 43/255, green: 145/255, blue: 254/255, alpha: 1)
    goSettingButton.layer.cornerRadius = 2
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
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
