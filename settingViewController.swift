//
//  settingViewController.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/08/13.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

  @IBOutlet weak var setUpButton: UIButton!
  @IBAction func setUp(_ sender: Any) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(true, forKey: "hasSettings")
    let smokingInfoView = storyboard!.instantiateViewController(withIdentifier: "smokingInfoView")
    self.present(smokingInfoView, animated: true, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

        // Do any additional setup after loading the view.
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
