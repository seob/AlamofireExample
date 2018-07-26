//
//  EntryViewController.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 7. 22..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class EntryViewController: UIViewController {
  
  @IBAction private func presentLogin(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Login", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
    show(vc, sender: nil)
  }
  
  @IBAction private func presentSignUp(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Login", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
    show(vc, sender: nil)
  }
    @IBAction private func  unwindToEntry(_ sender: UIStoryboardSegue) {
        
    }
    
  deinit {
    print("\(self) has deinitialized")
  }
}
