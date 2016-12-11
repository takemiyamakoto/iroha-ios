//
//  ReceiveViewController.swift
//  Example-Point
//
//  Created by Kaji Satoshi on 2016/12/12.
//  Copyright © 2016年 Soramitsu Co., Ltd. All rights reserved.
//

import UIKit
import TextFieldEffects

class ReceiveViewController: UIViewController {
    
    @IBOutlet weak var property: UILabel!
    @IBOutlet weak var qrImg: UIImageView!
    @IBOutlet weak var pubkey: UITextField!
    @IBOutlet weak var amountField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        amountField.text = "\(DataManager.instance.property) IRH"
        pubkey.text = KeychainManager.sharedManager.keychain["publicKey"]
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