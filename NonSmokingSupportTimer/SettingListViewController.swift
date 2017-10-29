//
//  SettingListViewController.swift
//  NonSmokingSupportTimer
//
//  Created by nomura yoshihiro on 2017/10/28.
//  Copyright © 2017年 nomuyoshi. All rights reserved.
//

import UIKit

class SettingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  @IBAction func backSmokingInfo(_ sender: UIBarButtonItem) {
    let smokingInfo = storyboard!.instantiateViewController(withIdentifier: "smokingInfoView")
    self.present(smokingInfo, animated: true, completion: nil)
  }
  let items = ["喫煙データ変更", "禁煙再スタート", "リセット"]

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - UITableViewDelegate
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.section == 0 {
      switch indexPath.row {
      case 0: // 設定変更
        let settingView = storyboard!.instantiateViewController(withIdentifier: "settingView")
        self.present(settingView, animated: true, completion: nil)
      case 1: // 再スタート
        let now = Date()
        UserDefaults.standard.set(now, forKey: "startAt")
        if UserDefaults.standard.synchronize() {
          let smokingInfo = storyboard!.instantiateViewController(withIdentifier: "smokingInfoView")
          self.present(smokingInfo, animated: true, completion: nil)
        }
      case 2: // リセット
        let appIdentifier:String = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appIdentifier)
        if UserDefaults.standard.synchronize() {
          let settingView = storyboard!.instantiateViewController(withIdentifier: "settingView")
          self.present(settingView, animated: true, completion: nil)
        }
      default:
        print("エラー")
      }
    }
  }

  // MARK: - UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SettingListItem") as! SettingListTableViewCell
      cell.settingItem.text = items[indexPath.row]
      return cell
    }
    return UITableViewCell()
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
