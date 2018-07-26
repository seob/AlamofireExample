//
//  LoginViewController.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 3. 27..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import Alamofire

final class LoginViewController: UIViewController {
  
  @IBOutlet private weak var usernameTextField: UITextField!
  @IBOutlet private weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    usernameTextField.becomeFirstResponder()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    view.endEditing(true)
  }
 
  @IBAction private func requestSignIn(_ sender: UIButton) {
     print("\n ----------- [requestSignIn] ----------- \n")
    Loginhandel()
  }
 
    func Loginhandel(){
        guard let username = usernameTextField.text , !username.isEmpty ,
              let userpwd = passwordTextField.text , !userpwd.isEmpty
        else {
            return
        }
        //Token e930c74281f5e9f85debf4b466eec79f452c377b
        //Authorization
        let apiURL = "https://api.lhy.kr/members/auth-token/"
        let parameters: [String: Any] = [
            "username": username,
            "password": userpwd,
            ]
        let MY_KEY = "Token 05957ab279e5208cb8d68a434b08a38ff742a411"
        let headers: HTTPHeaders = [
            //"Authorization": MY_KEY,
            "Accept": "application/json"
        ]
        
        Alamofire.request(apiURL,
                          method: .post,
                          parameters: parameters,headers: headers)
            .validate(statusCode: 200..<400)
            .responseJSON { [weak self] response in
                switch(response.result)
                {
                case .success(_):
                    if response.result.value != nil
                    {
                        let dict :NSDictionary = response.result.value! as! NSDictionary
                        
                        let token = dict.value(forKey: "token")as! String
                        UserDefaults.standard.setValue(token, forKey: tokenKays)
                        UserDefaults.standard.synchronize()
                        
                        print("\n ----------- [token: \(token)] ----------- \n")
                        
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "ListNavination")
                        self?.present(vc, animated: true, completion: nil)
                     }
                    break
                    
                case .failure(_):
                    print(response.result.error!)
                    break
                }
                
        }
    }
    
 
  deinit {
    print("\(self) has deinitialized")
  }
}

